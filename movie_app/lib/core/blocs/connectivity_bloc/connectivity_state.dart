part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();

  @override
  List<Object?> get props => [];
}

class ConnectivityInitial extends ConnectivityState {
  const ConnectivityInitial();
}

class ConnectivityChecking extends ConnectivityState {
  const ConnectivityChecking();
}

class ConnectedToInternet extends ConnectivityState {
  const ConnectedToInternet();
}

class NoInternetConnection extends ConnectivityState {
  const NoInternetConnection();
}
