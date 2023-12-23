import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utilities/themes/theme.exports.dart';

class MovieSectionTitleWidget extends StatelessWidget {
  const MovieSectionTitleWidget({
    required this.title,
    this.trailingText,
    this.onTrailingTap,
    super.key,
  });

  final String title;
  final String? trailingText;
  final VoidCallback? onTrailingTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10).r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: context.appTextTheme.h1?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColorTheme.darkBlue,
            ),
          ),
          if (trailingText != null)
            InkWell(
              onTap: onTrailingTap,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    trailingText!,
                    style: context.appTextTheme.body?.copyWith(
                      color: AppColorTheme.darkBlue,
                    ),
                  ),
                  5.horizontalSpaceRadius,
                  const Icon(
                    Icons.arrow_forward_ios,
                    size: 12,
                    color: AppColorTheme.darkBlue,
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
