// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';

import 'package:rickandmorty/controller/cubits/getCharacters/get_characters_state.dart';
import 'package:rickandmorty/data/repository/all_characters_repository.dart';

class GetCharactersCubit extends Cubit<GetCharactersState> {
  final AllCharactersRepository allCharactersRepository;

  GetCharactersCubit(
    this.allCharactersRepository,
  ) : super(GetCharactersInitial());

  void getCharacters() {
    emit(GetCharactersInitial());
    allCharactersRepository.getAllCharactersFromJson().then((result){
      if (result == "error") {
        emit(GetCharactersError(errorMessage: "Error"));
      }
      else{
        emit(GetCharactersLoaded(characters: result));
      }
    });
  }
}
