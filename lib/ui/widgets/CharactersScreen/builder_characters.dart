import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_state.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_cubit.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_state.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/others/fonctions/error_dialog.dart';
import 'package:rickandmorty/ui/screens/CharactersScreen/details_character.dart';
import 'package:rickandmorty/ui/widgets/CharactersScreen/BuilderCharacters/grid_characters.dart';
import 'package:rickandmorty/ui/widgets/loading_indicator.dart';
import 'package:rickandmorty/ui/widgets/CharactersScreen/BuilderCharacters/my_character.dart';
import 'package:rickandmorty/ui/widgets/CharactersScreen/BuilderCharacters/retry_get_characters.dart';

class BuilderCharacters extends StatelessWidget {
  List<Character> allChartacters = [];
  List<Character> resultCharacters = [];

  BuilderCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<GetCharactersCubit>(context).getCharacters();
    return BlocBuilder<GetCharactersCubit, GetCharactersState>(
      builder: (context, state) {
        if (state is GetCharactersInitial) {
          return LoadingIndicator();
        } else if (state is GetCharactersLoaded) {
          allChartacters = state.characters;
          return BlocBuilder<InSearchBloc, SearchState>(
              builder: (bloc, resultView) {
            if (resultView is OutSearchState) {
              return GridCharacters(
                  items: allChartacters,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsCharacter(
                                character: allChartacters[index],
                              ),
                            ),
                          );
                          print("tap");
                        },
                        child: Hero(
                            tag: allChartacters[index].id,
                            child:
                                MyCharacter(character: allChartacters[index])));
                  });
            } else if (resultView is LoadingSearchState) {
              return LoadingIndicator();
            } else if (resultView is InSearchState) {
              resultCharacters = resultView.resultCharacters;
              return GridCharacters(
                  items: resultCharacters,
                  itemBuilder: (BuildContext context, int index) {
                    return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => DetailsCharacter(
                                character: resultCharacters[index],
                              ),
                            ),
                          );
                          print("tap");
                        },
                        child: Hero(
                            tag: resultCharacters[index].id,
                            child:
                                MyCharacter(character: resultCharacters[index])));
                  });
            }
            return Container();
          });
        } else if (state is GetCharactersError) {
          errorDialog(context, "Error");
          return RetryGetCharacters();
        }
        return Container();
      },
    );
  }
}
