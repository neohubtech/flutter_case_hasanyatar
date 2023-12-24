import 'package:flutter/material.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

class CloseIcon extends StatelessWidget {
  const CloseIcon({
    required this.onTap,
    super.key,
    this.iconColor,
  });

  final VoidCallback onTap;
  final Color? iconColor;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Spacer(),
        InkWell(
          onTap: onTap,
          child: Icon(
            Icons.close,
            color: iconColor ?? AppColorTheme.darkBlue,
          ),
        ),
      ],
    );
  }
}
