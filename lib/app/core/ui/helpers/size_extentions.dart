import 'package:flutter/material.dart';

extension SizeExtensions on BuildContext {
  double get screenWidth => MediaQuery.of(this).size.width;
  double get screenHeight => MediaQuery.of(this).size.height;

  double percentageWidth(double percent) => screenWidth * percent;
  double percentageHeight(double percent) => screenHeight * percent;
}