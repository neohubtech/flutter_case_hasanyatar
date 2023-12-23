import 'package:dartz/dartz.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';

abstract class MovieRepository {
  Future<Either<ErrorResponse, MoviesModel?>> getMovies();
}
