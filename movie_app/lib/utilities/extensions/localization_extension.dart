import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension LocalizationExt on BuildContext {
  //locations
  AppLocalizations get localizations => AppLocalizations.of(this)!;
}
