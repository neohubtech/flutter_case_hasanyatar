import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/app_initializers.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

void main() {
  AppInitializers.initialize();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: DependencyInjection.shared.rootProviders(),
      child: MaterialApp(
        title: 'Movie App',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const _MaterialAppBody(
          child: Placeholder(),
        ),
      ),
    );
  }
}

class _MaterialAppBody extends StatelessWidget {
  const _MaterialAppBody({required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
