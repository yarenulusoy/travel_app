import 'package:flutter/material.dart';

class PositionedConstant {
  static PositionedConstant instance = PositionedConstant._init();
  PositionedConstant._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  final double positioned0 = 0;
  final double positioned5 = 5;
  final double positioned10 = 10;
  final double positioned20 = 20;
  final double positioned30 = 30;
  final double positioned40 = 40;
}
