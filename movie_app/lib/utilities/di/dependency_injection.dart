import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/core/exceptions/movie_error_handler.dart';
import 'package:movie_app/core/injection/dependency_injector.dart';
import 'package:movie_app/core/interfaces/error_message_handler.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';
import 'package:movie_app/core/network/network_manager.dart';
import 'package:movie_app/modules/home/data/data_source/movie_data_source.dart';
import 'package:movie_app/modules/home/data/repositories/movie_repository_impl.dart';
import 'package:movie_app/modules/home/domain/repositories/movie_repository.dart';

final getIt = DependencyInjector.I;

class DependencyInjection implements InitializationAdapter {
  const DependencyInjection._();

  static const shared = DependencyInjection._();

  @override
  FutureOr<void> initialize() async {
    await _configureInjections();
    await _repositoryInjections();
  }

  Future<void> _configureInjections() async {
    getIt
        .registerLazySingleton<NetworkManager>(NetworkManager.new)
        .registerLazySingleton<ErrorMessageHandler>(
          () => MovieErrorHandler.shared,
        )
        .registerSingleton<AppConfig>(AppConfig()..initialize())
        .registerSingleton<Connectivity>(Connectivity())
        .registerLazySingleton<ConnectivityBloc>(
          () => ConnectivityBloc(getIt<Connectivity>()),
        );
  }

  Future<void> _repositoryInjections() async {
    getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(MovieDataSource()),
    );
  }
}
