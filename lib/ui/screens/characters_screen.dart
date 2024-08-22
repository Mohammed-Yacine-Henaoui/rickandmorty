/*import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_cubit.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_state.dart';
import 'package:rickandmorty/ui/widgets/CharactersScreen/builder_characters.dart';
import 'package:rickandmorty/ui/widgets/my_text_form_field.dart';

class CharactersScreen extends StatelessWidget {
  final TextEditingController search_controller = TextEditingController();

  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();

  final FocusNode searchFocusNode = FocusNode();

  checkSearch() {
    searchFocusNode.unfocus();
  }

  CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SearchBarCubit, SearchBarState>(
      builder: (event, state) {
        return Scaffold(
            appBar: state is SearchBarOnSearchState
                ? AppBar(
                    leading: IconButton(
                        onPressed: () {
                          BlocProvider.of<SearchBarCubit>(context).offSearch();
                        },
                        icon: Icon(Icons.arrow_back)),
                    title: Form(
                      key: keyForm,
                      child: MyTextFormField(
                          my_icon: Icons.search,
                          obscure_text_psw: false,
                          my_controller: search_controller,
                          my_hint: "Find a character...",
                          my_validator: (value) {
                            return null;
                          },
                          focusNode: searchFocusNode,),
                    ),
                    actions: [
                      IconButton(onPressed: () => checkSearch(), icon: Icon(Icons.check)),
                    ],
                  )
                : AppBar(
                    title: const Text("Characters"),
                    actions: [
                      IconButton(onPressed: () {
                        BlocProvider.of<SearchBarCubit>(context).onSearch();
                      }, icon: Icon(Icons.search))
                    ],
                  ),
            body: BuilderCharacters());
      },
    );
  }
}*/
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_event.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_cubit.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_state.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_cubit.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_state.dart';
import 'package:rickandmorty/data/models/character.dart';
import 'package:rickandmorty/others/constants/my_colors.dart';
import 'package:rickandmorty/ui/widgets/CharactersScreen/builder_characters.dart';
import 'package:rickandmorty/ui/widgets/my_text_form_field.dart';

class CharactersScreen extends StatelessWidget {
  final TextEditingController search_controller = TextEditingController();

  GlobalKey<FormState> keyForm = new GlobalKey<FormState>();

  final FocusNode searchFocusNode = FocusNode();

  List<Character> allChartacters = [];

  checkSearch() {
    searchFocusNode.unfocus();
  }

  onChange(String newValue, BuildContext context) {
    BlocProvider.of<InSearchBloc>(context).add(
        InSearchEvent(searchText: newValue, allCharacters: allChartacters));

    print("newValue" + newValue);
    print(allChartacters.length);
  }

  CharactersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        Container(
          color: MyColors.motardColor,
          height: 80,
          width: double.infinity,
          child: BlocBuilder<SearchBarCubit, SearchBarState>(
              builder: (event, state) {
            if (state is SearchBarOffSearchState) {
              return Row(
                children: [
                  Expanded(
                    child: Center(
                      child: Text(
                        "Characters",
                        style: TextStyle(
                          color: MyColors.blackColorBody,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      BlocProvider.of<SearchBarCubit>(context).onSearch();
                    },
                    icon: Icon(Icons.search),
                  ),
                ],
              );
            } else if (state is SearchBarOnSearchState) {
              return Row(children: [
                IconButton(
                    onPressed: () {
                      search_controller.clear();
                      BlocProvider.of<SearchBarCubit>(context).offSearch();
                      BlocProvider.of<InSearchBloc>(context)
                          .add(OutSearchEvent());
                    },
                    icon: Icon(Icons.arrow_back)),
                BlocBuilder<GetCharactersCubit, GetCharactersState>(
                    builder: (context, state) {
                  if (state is GetCharactersLoaded) {
                    allChartacters = state.characters;
                    return Expanded(
                      child: Form(
                        key: keyForm,
                        child: MyTextFormField(
                          my_icon: Icons.search,
                          obscure_text_psw: false,
                          my_controller: search_controller,
                          my_hint: "Find a character...",
                          my_validator: (value) {
                            return null;
                          },
                          focusNode: searchFocusNode,
                          onChanged: (newValue) => onChange(newValue, context),
                        ),
                      ),
                    );
                  }
                  return Container();
                }),
                BlocBuilder<GetCharactersCubit, GetCharactersState>(
                    builder: (context, state) {
                  if (state is GetCharactersLoaded) {
                    return IconButton(
                        onPressed: () => checkSearch(),
                        icon: Icon(Icons.check));
                  }
                  return Container();
                }),
              ]);
            }
            return Container();
          }),
        ),
        Expanded(child: BuilderCharacters()),
      ]),
    );
  }
}
