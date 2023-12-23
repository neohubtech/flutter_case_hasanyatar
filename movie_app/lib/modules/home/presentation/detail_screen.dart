import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/layouts/primary_layout.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen(
    this.imageUrl, {
    super.key,
    this.isActiveHero = false,
  });
  final String imageUrl;

  final bool isActiveHero;

  @override
  Widget build(BuildContext context) {
    return PrimaryPageLayout(
      title: 'Detail Screen',
      bodyPadding: EdgeInsets.zero,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          10.verticalSpacingRadius,
          Expanded(
            child: Container(
              color: AppColorTheme.gray100,
              margin: const EdgeInsets.symmetric(vertical: 16).r,
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Center(
                  child: Hero(
                    tag: isActiveHero ? imageUrl : 'no_hero',
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12).r,
                      child: Image.network(
                        imageUrl,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(child: Text('Detail Screen')),
        ],
      ),
    );
  }
}
