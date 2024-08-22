import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_bloc.dart';
import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_cubit.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_cubit.dart';
import 'package:rickandmorty/data/repository/all_characters_repository.dart';
import 'package:rickandmorty/data/web_services/rick_and_morty_web_services.dart';
import 'package:rickandmorty/ui/widgets/my_root.dart';

class MyBlocProvider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    RickAndMortyWebServices rickAndMortyWebServices = RickAndMortyWebServices();
    AllCharactersRepository allCharactersRepository =
        AllCharactersRepository(rickAndMortyWebServices);

    return MultiBlocProvider(providers: [
      BlocProvider<SearchBarCubit>(
        create: (context) => SearchBarCubit(),
      ),
      BlocProvider<GetCharactersCubit>(
        create: (context) => GetCharactersCubit(allCharactersRepository),
      ),
      BlocProvider<InSearchBloc>(
        create: (context) => InSearchBloc(),
      )
    ], child: MyRoot());
  }
}
