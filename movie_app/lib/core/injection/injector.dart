import 'dart:async';

typedef AsyncFunc<T> = Future<T> Function();
typedef DisposableFunc<T> = FutureOr<dynamic> Function(T param);

abstract interface class Injector {
  /// Parameters:
  ///   - `factoryFunc`: An asynchronous function that creates an instance of type `T`.
  ///   - `instanceName`: An optional parameter for providing a named instance.
  ///   - `dependsOn`: An optional list of types that this singleton depends on.
  ///   - `signalsReady`: An optional boolean flag indicating whether the singleton is ready.
  ///   - `dispose`: An optional function that disposes of the singleton instance when no longer needed.
  ///
  Future<void> registerSingletonAsync<T extends Object>(
    AsyncFunc<T> factoryFunc, {
    String? instanceName,
    Iterable<Type>? dependsOn,
    bool? signalsReady,
    DisposableFunc<T>? dispose,
  });

  /// Note: This function will register the instance as a lazy singleton.
  /// This lazy means that the instance will not be created until it is needed.
  /// Parameters:
  /// - `function`: A function that creates an instance of type `T`.
  void registerLazySingleton<T extends Object>(T Function() function);

  /// Note: This function will register the instance as a singleton.
  ///
  /// Parameters:
  ///  - `instance`: An instance of type `T`.
  void registerSingleton<T extends Object>(T instance);

  /// Note: This function is not lazy. It will create a new instance of `T` every time it is called.
  ///
  /// Parameters:
  ///  - `function`: A function that creates an instance of type `T`.
  void registerFactory<T extends Object>(T Function() function);

  /// Get a dependency from the injector.
  T get<T extends Object>();

  /// Unregister a dependency from the injector.
  void unregister<T extends Object>();

  /// Callable class so that you can write `AppInjector.I<MyType>` instead of
  /// `AppInjector.I.get<MyType>`
  T call<T extends Object>();
}
