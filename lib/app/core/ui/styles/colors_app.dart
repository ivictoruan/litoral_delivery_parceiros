
import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  static ColorsApp get instance { 
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color.fromARGB(255, 0, 0, 0);
  Color get secondary => const Color(0XFFF88B0C);
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}