import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/core/injection/dependency_injector.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';
import 'package:movie_app/core/network/network_manager.dart';

final getIt = DependencyInjector.I;

class DependencyInjection implements InitializationAdapter {
  const DependencyInjection._();

  static const shared = DependencyInjection._();

  @override
  FutureOr<void> initialize() async {
    await _configureInjections();
  }

  Future<void> _configureInjections() async {
    getIt
        .registerLazySingleton<NetworkManager>(NetworkManager.new)
        .registerSingleton<AppConfig>(AppConfig()..initialize())
        .registerSingleton<Connectivity>(Connectivity())
        .registerLazySingleton<ConnectivityBloc>(
          () => ConnectivityBloc(getIt<Connectivity>()),
        );
  }
}
