import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';
import 'package:movie_app/modules/home/data/data_source/movie_data_source.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';
import 'package:movie_app/modules/home/domain/repositories/movie_repository.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

class MovieRepositoryImpl implements MovieRepository {
  MovieRepositoryImpl(this._movieDataSource);
  final MovieDataSource _movieDataSource;

  @override
  Future<Either<ErrorResponse, MoviesModel?>> getMovies() async {
    try {
      final data = await _movieDataSource.getMovie();
      return Right(data);
    } on DioException catch (exception) {
      return Left(
        getIt<ErrorMessageHandler>().getErrorMessage(exception),
      );
    } on Exception catch (exception) {
      return Left(
        getIt<ErrorMessageHandler>().getErrorMessage(exception),
      );
    } catch (e) {
      rethrow;
    }
  }
}
