import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/icons/close_icon.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_basket_cubit/movie_basket_cubit.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';
import 'package:movie_app/utilities/themes/theme.exports.dart';

class BasketShowBottomSheetLayout extends StatelessWidget {
  const BasketShowBottomSheetLayout({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Container(
        margin: EdgeInsets.all(24.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            CloseIcon(
              onTap: () => Navigator.of(context).pop(),
            ),
            24.verticalSpacingRadius,
            Text(
              context.localizations.my_basket,
              style: context.appTextTheme.h2?.copyWith(
                color: AppColorTheme.text,
              ),
            ),
            8.verticalSpacingRadius,
            BlocBuilder<MovieBasketCubit, MovieBasketState>(
              builder: (context, state) {
                return state.movieCount == 0
                    ? const SizedBox.shrink()
                    : Text(
                        context.localizations.there_are_count_movies(
                          state.movieCount,
                        ),
                        style: context.appTextTheme.bodySmall?.copyWith(
                          color: AppColorTheme.text,
                        ),
                      );
              },
            ),
            16.verticalSpacingRadius,
            const _BasketList(),
          ],
        ),
      ),
    );
  }
}

class _BasketList extends StatelessWidget {
  const _BasketList();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBasketCubit, MovieBasketState>(
      builder: (context, state) {
        if (state.movieCount == 0) {
          return Center(
            child: Text(context.localizations.there_are_no_movies),
          );
        } else {
          return Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: state.movieCount,
              itemBuilder: (_, index) {
                final movie = state.combinedList[index];
                return Padding(
                  padding: EdgeInsets.only(bottom: 8.r),
                  child: Dismissible(
                    key: ValueKey<CombinedList>(movie),
                    direction: DismissDirection.endToStart,
                    onDismissed: (direction) =>
                        context.read<MovieBasketCubit>().onMovieTap(movie),
                    background: Container(
                      decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: Padding(
                          padding: const EdgeInsets.all(8).r,
                          child: const Icon(
                            Icons.delete,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        color: AppColorTheme.gray100,
                        borderRadius: BorderRadius.circular(10).r,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10).r,
                            child: Image.network(
                              movie.imageUrl ?? '',
                              width: 70.w,
                              height: 70.h,
                              fit: BoxFit.cover,
                            ),
                          ),
                          10.horizontalSpaceRadius,
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                4.verticalSpacingRadius,
                                Text(
                                  movie.name ?? '',
                                  style: context.appTextTheme.bodySmallEmphasis
                                      ?.copyWith(
                                    color: AppColorTheme.text,
                                  ),
                                ),
                                1.verticalSpacingRadius,
                                Text(
                                  movie.explanation ?? '',
                                  style: context.appTextTheme.xSmallRegular
                                      ?.copyWith(
                                    color: AppColorTheme.text,
                                  ),
                                ),
                                4.verticalSpacingRadius,
                                Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: EdgeInsets.only(right: 10.r),
                                    child: Text(
                                      movie.type ?? '',
                                      style: context.appTextTheme.xSmallEmphasis
                                          ?.copyWith(
                                        color: AppColorTheme.text,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          );
        }
      },
    );
  }
}
