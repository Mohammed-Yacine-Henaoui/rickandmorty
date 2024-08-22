// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:rickandmorty/data/models/character.dart';

abstract class GetCharactersState {}

class GetCharactersInitial extends GetCharactersState {}

class GetCharactersLoaded extends GetCharactersState {
  List<Character> characters;
  GetCharactersLoaded({
    required this.characters,
  });
}

class GetCharactersError extends GetCharactersState {
  String errorMessage;
  GetCharactersError({
    required this.errorMessage,
  });
}
