import 'package:flutter/material.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  // String get font => 'mplus1';

  TextStyle get textLight => const TextStyle(
        fontWeight: FontWeight.w300,
        // fontFamily: font,
      );

  TextStyle get textRegular => const TextStyle(
        fontWeight: FontWeight.normal,
        // fontFamily: font,
      );
  TextStyle get textMedium => const TextStyle(
        fontWeight: FontWeight.w500,
        // fontFamily: font,
      );
  TextStyle get textSemiBold => const TextStyle(
        fontWeight: FontWeight.w600,
        // fontFamily: font,
      );
  TextStyle get textBold => const TextStyle(
        fontWeight: FontWeight.bold,
        // fontFamily: font,
      );
  TextStyle get textExtraBold => const TextStyle(
        fontWeight: FontWeight.w800,
        // fontFamily: font,
      );
  TextStyle get textButtonLabel => textBold.copyWith(fontSize: 14);

  TextStyle get textTitle => textExtraBold.copyWith(fontSize: 28);
}

extension TextStylesExtensions on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}