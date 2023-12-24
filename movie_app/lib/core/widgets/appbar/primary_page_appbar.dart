import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utilities/themes/theme.exports.dart';

class PrimaryPageAppBar extends StatelessWidget implements PreferredSizeWidget {
  const PrimaryPageAppBar({
    required this.title,
    super.key,
    this.titleKey,
    this.backButtonKey,
    this.onBack,
    this.isBackActionEnabled = true,
    this.backIcon,
    this.height = 40,
    this.color,
    this.titleColor = AppColorTheme.material50,
    this.titleStyle,
    this.iconColor = Colors.black,
    this.actions = const [],
  });

  final Key? titleKey;
  final Key? backButtonKey;
  final String title;
  final VoidCallback? onBack;
  final double height;
  final Color? color;
  final List<Widget> actions;
  final Color titleColor;
  final Color iconColor;
  final TextStyle? titleStyle;
  final bool isBackActionEnabled;
  final Icon? backIcon;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      foregroundColor: Colors.black,
      title: Text(
        title,
        key: titleKey,
        style: titleStyle ??
            AppTextTheme(context).h2?.copyWith(
                  color: titleColor,
                ),
      ),
      leading: isBackActionEnabled
          ? IconButton(
              key: backButtonKey,
              icon: backIcon ?? const Icon(Icons.arrow_back_ios),
              color: iconColor,
              onPressed: onBack ?? () => Navigator.pop(context),
            )
          : null,
      actions: actions,
      backgroundColor: color,
      elevation: 0,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(height.h);
}
