import 'package:flutter/material.dart';

class ColorConstants{
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.
  final appleBlossom=const Color(0xffb04b4b);
  final hawkesBlue=const Color(0xffDEEEFD);
  final quilGray=const Color(0xffE6E6E5);
}