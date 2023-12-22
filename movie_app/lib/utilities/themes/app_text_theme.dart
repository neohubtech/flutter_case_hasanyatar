import 'package:flutter/material.dart';
import 'package:movie_app/utilities/themes/app_color_theme.dart';

part '../extensions/app_text_theme_extension.dart';

class AppTextTheme {
  AppTextTheme(this.context);

  final BuildContext context;

  TextTheme get _textTheme => Theme.of(context).textTheme;

  TextStyle? get hero => _textTheme.displayLarge
      ?.copyWith(
        fontSize: 32,
        fontWeight: FontWeight.w600,
        height: 1.3,
      )
      .textStyleInterceptor();

  TextStyle? get h1 => _textTheme.displayLarge
      ?.copyWith(
        fontSize: 24,
        fontWeight: FontWeight.w500,
        height: 1.3,
      )
      .textStyleInterceptor();

  TextStyle? get h2 => _textTheme.displayMedium
      ?.copyWith(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        height: 1.3,
      )
      .textStyleInterceptor();

  TextStyle? get h3 => _textTheme.displaySmall
      ?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        height: 1.3,
      )
      .textStyleInterceptor();

  TextStyle? get body => _textTheme.bodyMedium
      ?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get bodyEmphasis =>
      body?.copyWith(fontWeight: FontWeight.w600).textStyleInterceptor();

  TextStyle? get bodySmall => _textTheme.bodyMedium
      ?.copyWith(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get bodySmallEmphasis =>
      bodySmall?.copyWith(fontWeight: FontWeight.w600).textStyleInterceptor();

  TextStyle? get xSmallRegular => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get xxSmallRegular => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get xxSmallEmphasis => xxSmallRegular
      ?.copyWith(fontWeight: FontWeight.w600)
      .textStyleInterceptor();

  TextStyle? get xSmallEmphasis => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w600,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get footnote => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get formPlaceholder => body
      ?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w400,
      )
      .textStyleInterceptor();

  TextStyle? get miniLabel => _textTheme.bodySmall
      ?.copyWith(
        fontSize: 10,
        fontWeight: FontWeight.w500,
        height: 1.5,
      )
      .textStyleInterceptor();

  TextStyle? get button => _textTheme.labelLarge
      ?.copyWith(
        fontSize: 16,
        fontWeight: FontWeight.w600,
      )
      .textStyleInterceptor();
}

extension TextStyleX on TextStyle {
  TextStyle textStyleInterceptor() => copyWith(
        //  fontFamily: Constants.fedraSansToggfontFamily,
        color: AppColorTheme.text,
      );
}
