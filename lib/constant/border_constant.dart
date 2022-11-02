import 'package:flutter/material.dart';

class BorderConstant{
  static BorderConstant instance = BorderConstant._init();
  BorderConstant._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  final borderRadiusCircular20=BorderRadius.circular(20);
}