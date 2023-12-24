import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:mocktail/mocktail.dart';

import 'package:movie_app/core/injection/dependency_injector.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';
import 'package:movie_app/modules/home/domain/repositories/movie_repository.dart';

final getIt = DependencyInjector.I;

final class MockConnectivity extends Mock implements Connectivity {}

final class MockMovieRepository extends Mock implements MovieRepository {}

final class MockDependencyInjection implements InitializationAdapter {
  final connectivity = MockConnectivity();
  final movieRepository = MockMovieRepository();

  @override
  FutureOr<void> initialize() async {
    await _configureRepositoryInjection();
    await _configureBlocInjection();
  }

  Future<void> _configureBlocInjection() async {}

  Future<void> _configureRepositoryInjection() async {
    getIt
      ..registerSingleton<MockConnectivity>(connectivity)
      ..registerLazySingleton<MovieRepository>(() => movieRepository);
  }
}
