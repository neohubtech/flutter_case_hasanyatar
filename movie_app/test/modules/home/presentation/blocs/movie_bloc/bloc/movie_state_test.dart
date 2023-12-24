import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/modules/home/data/models/banner_list/banner_list_model.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_bloc/bloc/movie_bloc.dart';

void main() {
  group('MovieState', () {
    test('MovieInitial should equal itself', () {
      final movieInitialState = MovieInitial();

      expect(movieInitialState, movieInitialState);
    });

    test('MovieLoading should equal itself', () {
      final movieLoadingState = MovieLoading();

      expect(movieLoadingState, movieLoadingState);
    });

    test('MovieEmpty should equal itself', () {
      final movieEmptyState = MovieEmpty();

      expect(movieEmptyState, movieEmptyState);
    });

    test('MovieLoaded should equal itself and have the correct props', () {
      const moviesModel = MoviesModel(
          bannerList: [BannerList()], combinedList: [CombinedList()]);
      const movieLoadedState1 = MovieLoaded(moviesModel: moviesModel);
      const movieLoadedState2 = MovieLoaded(moviesModel: moviesModel);

      expect(movieLoadedState1, movieLoadedState2);
      expect(
        movieLoadedState1.props,
        [moviesModel, moviesModel.bannerList, moviesModel.combinedList],
      );
    });

    test('MovieError should equal itself and have the correct props', () {
      final errorResponse = ErrorResponse<DioException>(
        'message',
        exception: DioException(
          requestOptions: RequestOptions(path: ''),
        ),
      );
      final movieErrorState1 = MovieError(errorResponse);
      final movieErrorState2 = MovieError(errorResponse);

      expect(movieErrorState1, movieErrorState2);
      expect(movieErrorState1.props, [errorResponse, errorResponse]);
    });
  });
}
