import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';
import 'package:provider/provider.dart';

extension BottomSheetExtension on BuildContext {
  Future<void> showBottomSheetLayout({
    required Widget sheetLayout,
    bool isDismissible = true,
    double maxHeight = .8,
    double minHeight = .8,
    Color backgroundColor = AppColorTheme.pureWhite,
    Color? barrierColor,
  }) async {
    await showModalBottomSheet<void>(
      context: this,
      backgroundColor: backgroundColor,
      barrierColor: barrierColor,
      isScrollControlled: true,
      isDismissible: isDismissible,
      enableDrag: isDismissible,
      builder: (context) => sheetLayout,
      useRootNavigator: true,
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10),
          topRight: Radius.circular(10),
        ),
      ),
      constraints: BoxConstraints(
        maxHeight: maxHeight.sh,
        minHeight: minHeight.sh,
      ),
    );
  }
}
