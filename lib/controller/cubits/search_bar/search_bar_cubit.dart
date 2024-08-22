import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rickandmorty/controller/cubits/Search_bar/Search_bar_state.dart';

class SearchBarCubit extends Cubit<SearchBarState> {
  SearchBarCubit() : super(SearchBarOffSearchState());

  void onSearch() {
    emit(SearchBarOnSearchState());
  }

  void offSearch() {
    emit(SearchBarOffSearchState());
  }
}
