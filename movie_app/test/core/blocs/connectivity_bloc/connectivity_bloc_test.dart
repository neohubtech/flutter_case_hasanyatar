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
      // Build the ConnectivityBloc and mock the onConnectivityChanged stream. When connected to WiFi,
      when(() => mockDI.connectivity.onConnectivityChanged).thenAnswer(
        (_) => Stream<ConnectivityResult>.fromIterable([
          // Act(1) Simulate WiFi connection.
          ConnectivityResult.wifi,
          // Act(2) Simulate no connection.
          ConnectivityResult.none,
          // Act(3) Simulate WiFi connection again.
          ConnectivityResult.wifi,
        ]),
      );
      return connectivityBloc;
    },
    act: (bloc) => bloc.add(CheckConnectivityStatus()),
    tearDown: () => connectivityBloc.close(),
    expect: () => const <ConnectivityState>[
      // Expect(1) Initial state when checking connectivity.
      ConnectivityChecking(),
      // Expect(2) WiFi connection detected.
      ConnectedToInternet(),
      // Expect(3) No connection detected.
      NoInternetConnection(),
      // Expect(4) WiFi connection detected again.
      ConnectedToInternet(),
    ],
  );

  blocTest<ConnectivityBloc, ConnectivityState>(
    'emits [ConnectivityChecking, NoInternetConnection] when ConnectivityResult.none is received',
    build: () {
      // Build the ConnectivityBloc and mock the onConnectivityChanged stream. When no connection is detected,
      when(() => mockDI.connectivity.onConnectivityChanged).thenAnswer(
        (_) => Stream<ConnectivityResult>.fromIterable(
          [
            // Act(1) Simulate no connection.
            ConnectivityResult.none,
            // Act(2) Simulate WiFi connection again.
            ConnectivityResult.wifi,
            // Act(3) Simulate no connection.
            ConnectivityResult.none,
          ],
        ),
      );
      return connectivityBloc;
    },
    act: (bloc) => bloc.add(CheckConnectivityStatus()),
    tearDown: () => connectivityBloc.close(),
    expect: () => const <ConnectivityState>[
      // Expect(1) Initial state when checking connectivity.
      ConnectivityChecking(),
      // Expect(2) No connection detected.
      NoInternetConnection(),
      // Expect(3) WiFi connection detected.
      ConnectedToInternet(),
      // Expect(4) No connection detected.
      NoInternetConnection(),
    ],
  );
}
