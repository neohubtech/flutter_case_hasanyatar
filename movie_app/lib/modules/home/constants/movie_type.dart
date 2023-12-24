import 'package:flutter/material.dart';
import 'package:movie_app/core/constants/assets.gen.dart';
import 'package:movie_app/utilities/extensions/localization_extension.dart';

enum MovieType {
  action,
  adventure,
  animation,
  comedy,
  horror,
  scienceFiction;

  String name(BuildContext context) => switch (this) {
        MovieType.action => context.localizations.action,
        MovieType.adventure => context.localizations.adventure,
        MovieType.animation => context.localizations.animation,
        MovieType.comedy => context.localizations.comedy,
        MovieType.horror => context.localizations.horror,
        MovieType.scienceFiction => context.localizations.science_fiction
      };

  String get imageUrl => switch (this) {
        MovieType.action => Assets.images.action.path,
        MovieType.adventure => Assets.images.adventure.path,
        MovieType.animation => Assets.images.animation.path,
        MovieType.comedy => Assets.images.comedia.path,
        MovieType.horror => Assets.images.horror.path,
        MovieType.scienceFiction => Assets.images.scienceFiction.path
      };
}
