import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/app_initializers.dart';
import 'package:movie_app/core/blocs/connectivity_bloc/connectivity_bloc.dart';
import 'package:movie_app/modules/home/presentation/principal_screen.dart';
import 'package:movie_app/utilities/di/global_bloc_providers.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';

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
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                backgroundColor: const Color(0xffFA6B00),
                duration: const Duration(days: 365),
                content: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Text(context.localizations.no_internet_connection),
                ),
              ),
            );
          } else if (state is ConnectedToInternet) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar();
          }
        },
        child: const PrincipalScreen(),
      ),
    );
  }
}
