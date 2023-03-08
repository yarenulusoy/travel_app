import 'package:flutter/material.dart';

class PaddingConstants{
  static PaddingConstants instance = PaddingConstants._init();
  PaddingConstants._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  final paddingAll10= const EdgeInsets.all(10);
  final paddingVertical10=const EdgeInsets.symmetric(vertical: 10);
  final paddingVertical5=const EdgeInsets.symmetric(vertical: 5);
  final paddingHorizontal15=const EdgeInsets.symmetric(horizontal: 15);
  final paddingAll15=const EdgeInsets.all(15);

  final paddingOnlyRight15=const EdgeInsets.only(right: 15);
  final paddingOnlyBottom30=const EdgeInsets.only(bottom: 30);
}