import 'package:bloc_test/bloc_test.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';

import '../../../di/mock_dependency_injection.dart';

class MockConnectivity extends Mock implements Connectivity {}

void main() {
  late ConnectivityBloc connectivityBloc;
  final mockDI = MockDependencyInjection();

  setUp(() async {
    await mockDI.initialize();
    connectivityBloc = ConnectivityBloc(mockDI.connectivity);
  });

  tearDown(() {
    connectivityBloc.close();
  });

  blocTest<ConnectivityBloc, ConnectivityState>(
    'emits [ConnectivityChecking, ConnectedToInternet] when ConnectivityResult.wifi is received',
    build: () {
      when(() => mockDI.connectivity.onConnectivityChanged).thenAnswer(
        (_) =>
            Stream<ConnectivityResult>.fromIterable([ConnectivityResult.wifi]),
      );
      return connectivityBloc;
    },
    act: (bloc) => bloc.add(CheckConnectivityStatus()),
    tearDown: () => connectivityBloc.close(),
    expect: () => const <ConnectivityState>[
      ConnectivityChecking(),
      ConnectedToInternet(),
    ],
  );

  blocTest<ConnectivityBloc, ConnectivityState>(
    'emits [ConnectivityChecking, NoInternetConnection] when ConnectivityResult.none is received',
    build: () {
      when(() => mockDI.connectivity.onConnectivityChanged).thenAnswer(
        (_) =>
            Stream<ConnectivityResult>.fromIterable([ConnectivityResult.none]),
      );
      return connectivityBloc;
    },
    act: (bloc) => bloc.add(CheckConnectivityStatus()),
    tearDown: () => connectivityBloc.close(),
    expect: () => const <ConnectivityState>[
      ConnectivityChecking(),
      NoInternetConnection(),
    ],
  );
}
