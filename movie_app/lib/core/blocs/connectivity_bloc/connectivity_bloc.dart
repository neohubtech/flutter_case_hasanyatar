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
  late StreamSubscription<ConnectivityResult> _subscription;

  void _updateConnectivityStatus(
    ConnectivityResult connectivityResult,
    Emitter<ConnectivityState> emit,
  ) {
    switch (connectivityResult) {
      case ConnectivityResult.wifi:
      case ConnectivityResult.mobile:
        emit(const ConnectedToInternet());
      default:
        emit(const NoInternetConnection());
        break;
    }
  }

  FutureOr<void> _onCheckConnectivityStatus(
    CheckConnectivityStatus event,
    Emitter<ConnectivityState> emit,
  ) async {
    emit(const ConnectivityChecking());
    _subscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) {
        _updateConnectivityStatus(connectivityResult, emit);
      },
    );
  }

  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
