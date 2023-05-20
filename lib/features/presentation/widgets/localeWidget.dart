

import 'package:flutter/material.dart';
import 'package:project/core/resources/export_file.dart';


class LocalizationWidget extends StatelessWidget {
  final Widget child;
  const LocalizationWidget({
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    return EasyLocalization(
        supportedLocales: AppConstants.supportedLocales.toList(),
        path: AppConstants.assetTranslationPath,
        saveLocale: AppConstants.defaultEmptyBoolTrue,
        startLocale: AppConstants.defaultLocal,
        fallbackLocale: AppConstants.defaultLocal,
        useFallbackTranslations: AppConstants.defaultEmptyBoolTrue,
        useOnlyLangCode: AppConstants.defaultEmptyBoolTrue,
        child:  child);
  }
}