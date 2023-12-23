import 'package:flutter_neumorphic_plus/flutter_neumorphic.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

class NeumorphicWidget extends StatelessWidget {
  const NeumorphicWidget({
    required this.child,
    this.depth = 5,
    this.intensity = 1,
    super.key,
  });

  final Widget child;
  final double depth;
  final double intensity;
  @override
  Widget build(BuildContext context) {
    return Neumorphic(
      style: NeumorphicStyle(
        depth: depth,
        intensity: intensity,
        shape: NeumorphicShape.flat,
        boxShape: NeumorphicBoxShape.roundRect(
          BorderRadius.circular(10).r,
        ),
        lightSource: LightSource.topLeft,
        shadowDarkColor: AppColorTheme.darkBlue.withOpacity(0.6),
      ),
      child: child,
    );
  }
}
