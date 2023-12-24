import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/home/constants/movie_type.dart';
import 'package:movie_app/modules/home/presentation/widgets/movie_section_title_widget.dart';
import 'package:movie_app/modules/home/presentation/widgets/neumorphic_widget.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

class CategoryMovieWidget extends StatelessWidget {
  const CategoryMovieWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        10.verticalSpacingRadius,
        MovieSectionTitleWidget(
          title: context.localizations.categories,
          trailingText: context.localizations.more,
        ),
        10.verticalSpacingRadius,
        const _CategoryListWidget(),
      ],
    );
  }
}

class _CategoryListWidget extends StatelessWidget {
  const _CategoryListWidget();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 240.h,
      child: Center(
        child: GridView.builder(
          shrinkWrap: true,
          itemCount: 6,
          scrollDirection: Axis.horizontal,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            crossAxisSpacing: 10.r,
            mainAxisSpacing: 10.r,
            childAspectRatio: 0.38.r,
          ),
          itemBuilder: (context, index) {
            return NeumorphicWidget(
              depth: 2,
              intensity: 0.8,
              child: GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6).r,
                    color: AppColorTheme.gray100,
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          color: AppColorTheme.gray100,
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10).r,
                            child: Image.asset(
                              MovieType.values[index].imageUrl,
                              height: 72.h,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      6.horizontalSpaceRadius,
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              MovieType.values[index].name(context),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
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
      ),
    );
  }
}
