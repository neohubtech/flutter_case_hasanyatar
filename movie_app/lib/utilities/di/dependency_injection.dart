import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/config/app_config.dart';
import 'package:movie_app/core/injection/dependency_injector.dart';
import 'package:movie_app/core/interfaces/initialization_adapter.dart';

final getIt = DependencyInjector.I;

class DependencyInjection implements InitializationAdapter {
  const DependencyInjection._();

  static const shared = DependencyInjection._();

  @override
  FutureOr<void> initialize() {
    // TODO: implement initialize
    throw UnimplementedError();
  }

  List<RepositoryProvider<dynamic>> rootProviders() {
    return [
      RepositoryProvider<AppConfig>(
        create: (_) => getIt<AppConfig>(),
      ),
    ];
  }
}
