import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:movie_app/core/constants/assets.gen.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';
import 'package:movie_app/utilities/themes/theme.exports.dart';

class NoInternetDialog extends StatelessWidget {
  const NoInternetDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          12.verticalSpacingRadius,
          Lottie.asset(
            Assets.lotties.noConnection,
            height: 80.h,
          ),
          Text(
            context.localizations.whoops,
            style: context.appTextTheme.h1?.copyWith(
              fontWeight: FontWeight.bold,
              color: AppColorTheme.material30,
            ),
          ),
          8.verticalSpacingRadius,
          Text(
            context.localizations.no_internet_connection,
            textAlign: TextAlign.center,
            style: context.appTextTheme.bodySmall,
          ),
          12.verticalSpacingRadius,
        ],
      ),
    );
  }
}
