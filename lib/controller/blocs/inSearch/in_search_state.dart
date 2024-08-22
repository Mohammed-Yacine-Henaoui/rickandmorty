import 'package:rickandmorty/data/models/character.dart';

abstract class SearchState {}

class LoadingSearchState extends SearchState {}

class InSearchState extends SearchState {
  final List<Character> resultCharacters;

  InSearchState(this.resultCharacters);
}

class OutSearchState extends SearchState {}
