
import 'dart:ui';

class ColorConstants{
  static ColorConstants instance = ColorConstants._init();
  ColorConstants._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  final appleBlossom=const Color(0xffb04b4b);
  final jordyBlue=const Color(0xff94ABF4);
}