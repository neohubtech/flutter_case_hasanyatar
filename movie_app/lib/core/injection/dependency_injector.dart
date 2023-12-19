import 'package:get_it/get_it.dart';

import 'package:movie_app/core/injection/injector.dart';

final class DependencyInjector implements Injector {
  DependencyInjector._();
  final GetIt _getIt = GetIt.instance;

  static Injector? _internal;

  static Injector get I => _instance;

  static Injector get _instance {
    _internal ??= DependencyInjector._();
    return _internal!;
  }

  @override
  void registerLazySingleton<T extends Object>(T Function() function) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerLazySingleton<T>(
        () => function.call(),
      );
    }
  }

  @override
  void registerSingleton<T extends Object>(T instance) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingleton<T>(instance);
    }
  }

  @override
  void registerFactory<T extends Object>(T Function() function) {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerFactory<T>(() => function.call());
    }
  }

  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void unregister<T extends Object>() => _getIt.unregister<T>();

  @override
  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  }) async {
    if (!_getIt.isRegistered<T>()) {
      _getIt.registerSingletonAsync<T>(
        factoryFunc,
        instanceName: instanceName,
        dependsOn: dependsOn,
        signalsReady: signalsReady,
        dispose: dispose,
      );
    }
  }

  @override
  T call<T extends Object>() => get<T>();
}
