import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';

part 'movie_basket_state.dart';

class MovieBasketCubit extends Cubit<MovieBasketState> {
  MovieBasketCubit() : super(const MovieBasketState(combinedList: []));

  void onMovieTap(CombinedList combinedData) {
    if (state.shouldContainMovie(combinedData)) {
      _removeMovie(combinedData);
    } else {
      _addMovie(combinedData);
    }
  }

  void _addMovie(CombinedList combinedData) {
    final combinedList = List.of(state.combinedList);

    if (!combinedList.contains(combinedData)) {
      combinedList.add(combinedData);
      emit(MovieBasketState(combinedList: combinedList));
    }
  }

  void _removeMovie(CombinedList combinedData) {
    final combinedList = List.of(state.combinedList);

    if (combinedList.contains(combinedData)) {
      combinedList.remove(combinedData);
      emit(MovieBasketState(combinedList: combinedList));
    }
  }
}
