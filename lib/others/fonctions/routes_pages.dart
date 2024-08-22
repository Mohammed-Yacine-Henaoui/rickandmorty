import 'package:flutter/material.dart';
import 'package:rickandmorty/others/constants/names_pages.dart';
import 'package:rickandmorty/ui/screens/characters_screen.dart';

Map<String, Widget Function(BuildContext)> RoutesPages(BuildContext context){
  return {
          NamesPages.charactersScreen: (context) => CharactersScreen(),
        };
}