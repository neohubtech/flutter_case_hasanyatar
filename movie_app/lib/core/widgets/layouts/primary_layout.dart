import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movie_app/core/widgets/appbar/primary_page_appbar.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

class PrimaryPageLayout extends StatelessWidget {
  const PrimaryPageLayout({
    required this.body,
    required this.title,
    this.lightStatusBar = false,
    this.floatingActionButton,
    this.floatingActionButtonLocation,
    this.titleKey,
    this.backButtonKey,
    this.onBack,
    this.backIcon,
    this.isBackActionEnabled,
    this.extendBody = false,
    this.backgroundColor,
    this.bodyPadding,
    this.appbarColor,
    this.resizeToAvoidBottomInset,
    this.actions = const [],
    this.bottomNavigationBar,
    this.titleColor = AppColorTheme.turquoise,
    this.titleStyle,
    this.iconColor = Colors.black,
    this.isPinned = true,
    this.physics,
    this.isTitleEditable = false,
    this.keyboardDismissBehavior = KeyboardDismissBehavior.whenTapped,
    super.key,
  });

  final EdgeInsets? bodyPadding;

  final bool lightStatusBar;
  final Key? titleKey;
  final Key? backButtonKey;
  final VoidCallback? onBack;
  final Icon? backIcon;
  final String title;
  final Widget body;
  final Widget? floatingActionButton;
  final FloatingActionButtonLocation? floatingActionButtonLocation;
  final bool extendBody;
  final bool? resizeToAvoidBottomInset;
  final Color? backgroundColor;
  final Color? appbarColor;
  final List<Widget> actions;
  final Widget? bottomNavigationBar;
  final Color titleColor;
  final Color iconColor;
  final bool isPinned;
  final ScrollPhysics? physics;
  final bool isTitleEditable;
  final TextStyle? titleStyle;
  final bool? isBackActionEnabled;
  final KeyboardDismissBehavior keyboardDismissBehavior;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        systemNavigationBarColor: appbarColor ?? AppColorTheme.pureWhite,
        systemNavigationBarIconBrightness: Brightness.light,
        statusBarColor: appbarColor,
        statusBarBrightness:
            lightStatusBar ? Brightness.dark : Brightness.light,
        statusBarIconBrightness:
            lightStatusBar ? Brightness.dark : Brightness.light,
      ),
      child: Scaffold(
        extendBody: extendBody,
        resizeToAvoidBottomInset: resizeToAvoidBottomInset,
        floatingActionButton: floatingActionButton,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        backgroundColor: backgroundColor ?? AppColorTheme.pureWhite,
        appBar: PrimaryPageAppBar(
          onBack: onBack,
          backIcon: backIcon,
          color: appbarColor,
          title: title,
          titleColor: titleColor,
          titleStyle: titleStyle,
          iconColor: iconColor,
          titleKey: titleKey,
          isBackActionEnabled: isBackActionEnabled ?? true,
          backButtonKey: backButtonKey,
          actions: actions,
        ),
        body: GestureDetector(
          onTap: () {
            if (FocusScope.of(context).hasFocus &&
                keyboardDismissBehavior == KeyboardDismissBehavior.whenTapped) {
              FocusScope.of(context).unfocus();
            }
          },
          child: Padding(
            padding: bodyPadding ??
                EdgeInsets.only(
                  left: 24.w,
                  right: 24.w,
                  top: 16.h,
                ),
            child: body,
          ),
        ),
        bottomNavigationBar: bottomNavigationBar,
      ),
    );
  }
}

enum KeyboardDismissBehavior {
  /// The keyboard will dismiss when the user taps the main body of the Scaffold.
  whenTapped,

  /// The keyboard will not dismiss automatically.
  none,
}
