// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rickandmorty/data/models/character.dart';

abstract class SearchEvent {}

class InSearchEvent extends SearchEvent {
  final String searchText;
  final List<Character> allCharacters;
  InSearchEvent({
    required this.searchText,
    required this.allCharacters,
  });
}

class OutSearchEvent extends SearchEvent {}
