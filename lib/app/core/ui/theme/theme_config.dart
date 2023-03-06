import 'package:flutter/material.dart';

import '../styles/app_styles.dart';
import '../styles/colors_app.dart';
import '../styles/text_styles.dart';

class ThemeConfig {
  ThemeConfig._();

  static final _defaultInputBorder = OutlineInputBorder(
      borderRadius: const BorderRadius.all(
        Radius.circular(7),
      ),
      borderSide: BorderSide(color: Colors.grey[400]!));

  static final ThemeData theme = ThemeData(
    primaryColor: ColorsApp.instance.primary,
    colorScheme: ColorScheme.fromSeed(
      seedColor: ColorsApp.instance.primary,
      primary: ColorsApp.instance.primary,
      secondary: ColorsApp.instance.secondary,
    ),
    appBarTheme: const AppBarTheme(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      iconTheme: IconThemeData(
        color: Colors.black,
      ),
    ),
    scaffoldBackgroundColor: Colors.white,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: AppStyles.instance.primaryButton,
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.white,
      isDense: true,
      contentPadding: const EdgeInsets.all(13),
      border: _defaultInputBorder,
      enabledBorder: _defaultInputBorder,
      focusedBorder: _defaultInputBorder,
      labelStyle: TextStyles.instance.textRegular.copyWith(color: Colors.black),
      errorStyle:
          TextStyles.instance.textRegular.copyWith(color: Colors.redAccent),
    ),
  );
}
