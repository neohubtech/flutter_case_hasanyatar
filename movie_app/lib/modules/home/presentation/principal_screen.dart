import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/layouts/primary_layout.dart';
import 'package:movie_app/modules/home/presentation/blocs/bottom_navigation_cubit/bottom_navigation_cubit.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_basket_cubit/movie_basket_cubit.dart';
import 'package:movie_app/modules/home/presentation/home_screen.dart';
import 'package:movie_app/modules/home/presentation/more_screen.dart';
import 'package:movie_app/modules/home/presentation/widgets/basket_show_bottom_sheet_layout.dart';
import 'package:movie_app/utilities/extensions/bottom_sheet_extension.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';
import 'package:movie_app/utilities/themes/app_text_theme.dart';

class PrincipalScreen extends StatelessWidget {
  const PrincipalScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieBasketCubit>(
          create: (context) => MovieBasketCubit(),
        ),
        BlocProvider<BottomNavigationCubit>(
          create: (context) => BottomNavigationCubit(),
        ),
      ],
      child: BlocBuilder<BottomNavigationCubit, int>(
        builder: (context, currentIndex) {
          return PrimaryPageLayout(
            isBackActionEnabled: false,
            bodyPadding: EdgeInsets.zero,
            title: switch (currentIndex) {
              0 => context.localizations.home,
              1 => context.localizations.more,
              _ => '',
            },
            floatingActionButton: Builder(
              builder: (context) {
                return const _FloatingActionButton();
              },
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            body: IndexedStack(
              index: currentIndex,
              children: const [
                HomeScreen(),
                MoreScreen(),
              ],
            ),
            bottomNavigationBar: _BottomNavigationBar(
              currentIndex: currentIndex,
            ),
          );
        },
      ),
    );
  }
}

class _BottomNavigationBar extends StatelessWidget {
  const _BottomNavigationBar({
    required this.currentIndex,
  });

  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: (index) => context
          .read<BottomNavigationCubit>()
          .onBottomNavigationItemTap(index),
      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home),
          label: context.localizations.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.more_horiz),
          label: context.localizations.more,
        ),
      ],
    );
  }
}

class _FloatingActionButton extends StatelessWidget {
  const _FloatingActionButton();

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (ctx) {
        return FloatingActionButton(
          shape: const CircleBorder(),
          onPressed: () => context.showBottomSheetLayout(
            sheetLayout: BlocProvider.value(
              value: context.read<MovieBasketCubit>(),
              child: const BasketShowBottomSheetLayout(),
            ),
          ),
          child: Stack(clipBehavior: Clip.none, children: [
            const Icon(Icons.shopping_cart),
            BlocBuilder<MovieBasketCubit, MovieBasketState>(
              builder: (context, state) {
                return state.movieCount == 0
                    ? const SizedBox.shrink()
                    : Positioned(
                        top: -12.r,
                        right: -7.w,
                        child: CircleAvatar(
                          radius: 8.r,
                          backgroundColor: Colors.red,
                          child: Center(
                            child: Text(
                              state.movieCount.toString(),
                              style:
                                  context.appTextTheme.xSmallEmphasis?.copyWith(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      );
              },
            ),
          ]),
        );
      },
    );
  }
}
