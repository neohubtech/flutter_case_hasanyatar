import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';

part 'connectivity_event.dart';
part 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  ConnectivityBloc() : super(const ConnectivityInitial()) {
    on<CheckConnectivityStatus>(_onCheckConnectivityStatus);
    on<UpdateConnectivityStatus>(_onUpdateConnectivityStatus);
  }

  final Connectivity connectivity = getIt<Connectivity>();
  StreamSubscription<ConnectivityResult>? _subscription;

  FutureOr<void> _onCheckConnectivityStatus(
    CheckConnectivityStatus event,
    Emitter<ConnectivityState> emit,
  ) async {
    emit(const ConnectivityChecking());
    add(UpdateConnectivityStatus(await connectivity.checkConnectivity()));
    _subscription = connectivity.onConnectivityChanged.listen(
      (connectivityResult) => add(UpdateConnectivityStatus(connectivityResult)),
    );
  }

  FutureOr<void> _onUpdateConnectivityStatus(
    UpdateConnectivityStatus event,
    Emitter<ConnectivityState> emit,
  ) async {
    if ([
      ConnectivityResult.wifi,
      ConnectivityResult.mobile,
    ].contains(event.connectivityResult)) {
      if (state is NoInternetConnection) {
        emit(const ReConnectedToInternet());
      } else {
        emit(const ConnectedToInternet());
      }
    } else {
      emit(const NoInternetConnection());
    }
  }

  @override
  Future<void> close() async {
    await _subscription?.cancel();

    return super.close();
  }
}
