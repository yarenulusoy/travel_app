import 'package:flutter/material.dart';

class ColorThemeLight {
  static ColorThemeLight? _instance;
  static ColorThemeLight get instance {
    _instance ??= ColorThemeLight._init(); // if(_instance==null) _instance=AppThemeLight._init();
    return _instance!;
  }

  ColorThemeLight._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  final melrose = const Color.fromRGBO(159, 232, 250,1);
  final vodka = const Color.fromRGBO(170, 196, 255,1);
  final periwinkle=const Color.fromRGBO(139, 152, 172,1);
  final black=const Color.fromRGBO(0, 0, 0, 1);
  final pictonBlue=const Color.fromRGBO(89,190,230,1);
}
