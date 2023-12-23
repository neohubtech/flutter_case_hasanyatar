import 'package:dio/dio.dart';
import 'package:movie_app/core/network/network_manager.dart';
import 'package:movie_app/modules/home/data/models/movies/movies_model.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';
import 'package:retrofit/http.dart';

part 'movie_data_source.g.dart';

@RestApi()
abstract class MovieDataSource {
  factory MovieDataSource({Dio? dio, String? baseUrl}) {
    return _MovieDataSource(
      dio ?? getIt<NetworkManager>().dio,
      baseUrl: baseUrl,
    );
  }

  @GET('/interview.json')
  Future<MoviesModel?> getMovie();
}
