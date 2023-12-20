import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/utilities/di/dependency_injection.dart';
import 'package:provider/single_child_widget.dart';

class GlobalBlocProviders {
  static List<SingleChildWidget> providers() {
    return [
      BlocProvider(
        create: (context) =>
            getIt<ConnectivityBloc>()..add(CheckConnectivityStatus()),
      ),
    ];
  }
}
