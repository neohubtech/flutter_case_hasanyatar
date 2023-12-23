import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';
import 'package:movie_app/modules/home/data/models/banner_list/banner_list_model.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';
import 'package:movie_app/modules/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  MovieBloc() : super(MovieInitial()) {
    on<GetMovieEvent>(_getMovie);
  }

  final movieRepository = getIt<MovieRepository>();

  Future<void> _getMovie(
    GetMovieEvent event,
    Emitter<MovieState> emit,
  ) async {
    emit(MovieLoading());
    try {
      final result = await movieRepository.getMovies();
      result.fold(
        (error) => emit(MovieError(error)),
        (data) => data == null
            ? emit(MovieEmpty())
            : emit(MovieLoaded(moviesModel: data)),
      );
    } catch (e) {
      getIt<ErrorMessageHandler>().defaultErrorMessage();
    }
  }
}
