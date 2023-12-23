import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/home/data/models/combined_list/combined_list_model.dart';
import 'package:movie_app/modules/home/presentation/blocs/movie_basket_cubit/movie_basket_cubit.dart';

import 'package:movie_app/modules/home/presentation/widgets/movie_section_title_widget.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';
import 'package:movie_app/utilities/themes/app_text_theme.dart';

class NewReleaseMovieWidget extends StatelessWidget {
  const NewReleaseMovieWidget(this.combinedList, {super.key});

  final List<CombinedList> combinedList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const MovieSectionTitleWidget(
          title: 'Yeni Çıkanlar',
          trailingText: 'Tümünü Gör',
        ),
        10.verticalSpacingRadius,
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 14).r,
          child: ListView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: combinedList.length,
            itemBuilder: (context, index) {
              return _CombinedListTile(combinedData: combinedList[index]);
            },
          ),
        ),
      ],
    );
  }
}

class _CombinedListTile extends StatelessWidget {
  const _CombinedListTile({
    required this.combinedData,
  });

  final CombinedList combinedData;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieBasketCubit, MovieBasketState>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 5).r,
          child: InkWell(
            onTap: () =>
                context.read<MovieBasketCubit>().onMovieTap(combinedData),
            borderRadius: BorderRadius.circular(10).r,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10).r,
                  child: Image.network(
                    combinedData.imageUrl ?? '',
                    width: 100.w,
                    height: 100.h,
                    fit: BoxFit.cover,
                  ),
                ),
                10.horizontalSpaceRadius,
                _MovieDescription(combinedData),
                Checkbox(
                  value: state.shouldContainMovie(combinedData),
                  onChanged: (value) =>
                      context.read<MovieBasketCubit>().onMovieTap(combinedData),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _MovieDescription extends StatelessWidget {
  const _MovieDescription(
    this.combinedData,
  );

  final CombinedList combinedData;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            combinedData.name ?? '',
            style: context.appTextTheme.bodyEmphasis?.copyWith(
              fontWeight: FontWeight.bold,
            ),
          ),
          3.verticalSpacingRadius,
          Text(
            combinedData.type ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.bodySmall?.copyWith(
              color: AppColorTheme.pureBlack,
            ),
          ),
          3.verticalSpacingRadius,
          Text(
            combinedData.explanation ?? '',
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
            style: context.appTextTheme.xSmallRegular?.copyWith(
              color: AppColorTheme.textField,
            ),
          ),
        ],
      ),
    );
  }
}
