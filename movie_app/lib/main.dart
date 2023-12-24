import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app_initializers.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/core/widgets/dialogs/no_internet_dialog.dart';
import 'package:movie_app/modules/home/presentation/principal_screen.dart';
import 'package:movie_app/utilities/di/global_bloc_providers.dart';

void main() {
  AppInitializers.initialize();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: GlobalBlocProviders.providers(),
      child: OrientationBuilder(
        builder: (context, orientation) {
          return ScreenUtilInit(
            designSize: orientation == Orientation.landscape
                ? const Size(844, 390)
                : const Size(390, 844),
            builder: (_, child) => const MaterialApp(
              localizationsDelegates: AppLocalizations.localizationsDelegates,
              supportedLocales: AppLocalizations.supportedLocales,
              debugShowCheckedModeBanner: false,
              home: _MaterialAppBody(),
            ),
          );
        },
      ),
    );
  }
}

class _MaterialAppBody extends StatelessWidget {
  const _MaterialAppBody();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<ConnectivityBloc, ConnectivityState>(
        listener: (context, state) {
          if (state is NoInternetConnection) {
            showDialog<void>(
              context: context,
              barrierDismissible: false,
              builder: (context) => const NoInternetDialog(),
            );
          } else if (state is ConnectedToInternet) {
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            }
          }
        },
        child: const PrincipalScreen(),
      ),
    );
  }
}
