import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc(this.connectivity) : super(const ConnectivityInitial()) {
    on<CheckConnectivityStatus>(_onCheckConnectivityStatus);
  }

  final Connectivity connectivity;

  ConnectivityState _updateConnectivityStatus(
    ConnectivityResult connectivityResult,
    Emitter<ConnectivityState> emit,
  ) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        return const ConnectedToInternet();
      default:
        return const NoInternetConnection();
    }
  }

  Future<void> _onCheckConnectivityStatus(
    CheckConnectivityStatus event,
    Emitter<ConnectivityState> emit,
  ) async {
    emit(const ConnectivityChecking());
    // Warning(Simulator): On iOS, the connectivity status might not update when WiFi status changes,
    // this is a known issue that only affects simulators. For details see https://github.com/fluttercommunity/plus_plugins/issues/479.
    await emit.forEach(
      connectivity.onConnectivityChanged,
      onData: (ConnectivityResult result) =>
          _updateConnectivityStatus(result, emit),
    );
  }
}
