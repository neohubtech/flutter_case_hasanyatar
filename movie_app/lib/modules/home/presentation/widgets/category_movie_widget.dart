import 'package:flutter/material.dart';
import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/modules/home/presentation/widgets/neumorphic_widget.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';
import 'package:movie_app/utilities/themes/app_text_theme.dart';

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
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10).r,
          child: Text(
            context.localizations.categories,
            style: context.appTextTheme.h1?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColorTheme.darkBlue,
            ),
          ),
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
                              'assets/images/adventure.jpeg',
                              height: 72.h,
                              fit: BoxFit.fitHeight,
                            ),
                          ),
                        ),
                      ),
                      6.horizontalSpaceRadius,
                      const Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Macera',
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
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
