import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';
import 'package:movie_app/modules/home/data/models/banner_list/banner_list_model.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';
import 'package:movie_app/modules/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_bloc/bloc/movie_bloc.dart';

import '../../../../../../di/mock_dependency_injection.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

class MockErrorMessageHandler extends Mock implements ErrorMessageHandler {}

void main() {
  const mockMovieModel = MoviesModel(
    bannerList: [
      BannerList(
        name: 'Movie 1',
        imageUrl:
            'https://image.tmdb.org/t/p/w500/6KErczPBROQty7QoIsaa6wJYXZi.jpg',
      ),
    ],
    combinedList: [
      CombinedList(
        name: 'Movie 2',
        type: 'Type 2',
        explanation: 'This is explanation 2',
        imageUrl:
            'https://image.tmdb.org/t/p/w220_and_h330_face/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg',
      ),
    ],
  );

  final mockDI = MockDependencyInjection();

  setUp(() async {
    await mockDI.initialize();
  });

  group('MovieBloc', () {
    blocTest<MovieBloc, MovieState>(
      'emits [MovieLoading, MovieLoaded] when GetMovieEvent is added and repository returns data',
      build: () {
        when(mockDI.movieRepository.getMovies)
            .thenAnswer((_) async => const Right(mockMovieModel));
        return MovieBloc();
      },
      act: (bloc) => bloc.add(const GetMovieEvent()),
      expect: () => [
        MovieLoading(),
        const MovieLoaded(moviesModel: mockMovieModel),
      ],
    );

    blocTest<MovieBloc, MovieState>(
      'emits [MovieLoading, MovieEmpty] when GetMovieEvent is added and repository returns null',
      build: () {
        when(mockDI.movieRepository.getMovies).thenAnswer(
          (_) async => const Right(null),
        );
        return MovieBloc();
      },
      act: (bloc) => bloc.add(const GetMovieEvent()),
      expect: () => [
        MovieLoading(),
        MovieEmpty(),
      ],
    );

    blocTest<MovieBloc, MovieState>(
      'emits [MovieLoading, MovieError] when GetMovieEvent is added and repository returns an error',
      build: () {
        when(mockDI.movieRepository.getMovies).thenAnswer((_) async => Left(
              ErrorResponse<DioException>(
                'Error Test',
                exception: DioException(
                  requestOptions: RequestOptions(path: ''),
                ),
              ),
            ));

        return MovieBloc();
      },
      act: (bloc) => bloc.add(const GetMovieEvent()),
      expect: () => [
        MovieLoading(),
        isA<MovieError>(),
      ],
    );
  });
}
