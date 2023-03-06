import 'package:flutter/material.dart';


class AppStyles {
  static AppStyles? _instance;

  AppStyles._();

  static AppStyles get instance {
    _instance ??= AppStyles._();
    return _instance!;
  }

  ButtonStyle get primaryButton => ElevatedButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(7),
        ),
        // textStyle: TextStyles.instance.textButtonLabel,
      );
}

extension AppStylesExtensions on BuildContext {
  AppStyles get appStyles => AppStyles.instance;
}