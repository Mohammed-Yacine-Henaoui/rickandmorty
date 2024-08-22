import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_event.dart';
import 'package:rickandmorty/controller/blocs/inSearch/in_search_state.dart';
import 'package:rickandmorty/data/models/character.dart';

class InSearchBloc extends Bloc<SearchEvent, SearchState> {
  InSearchBloc() : super(OutSearchState()) {
    on<InSearchEvent>((event, emit) {
      emit(LoadingSearchState());
      List<Character> resultCharacters = [];
      event.allCharacters.forEach((character) {
        if(character.name.toLowerCase().contains(event.searchText.toLowerCase())){
          resultCharacters.add(character);
        }
      });
      emit(InSearchState(resultCharacters));
    });
    on<OutSearchEvent>((event, emit) {
      emit(OutSearchState());
    });
  }
}
