import 'package:flutter/material.dart';
import 'package:nectar/core/localization/app_localizations.dart';

String getLangFromJson({required BuildContext context, required String text}) {
  return AppLocalizations.of(context).translate(text).toString();
}
