part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();

  @override
  List<Object?> get props => [];
}

class CheckConnectivityStatus extends ConnectivityEvent {}

class UpdateConnectivityStatus extends ConnectivityEvent {
  const UpdateConnectivityStatus(this.connectivityResult);

  final ConnectivityResult connectivityResult;

  @override
  List<Object?> get props => [connectivityResult];
}
