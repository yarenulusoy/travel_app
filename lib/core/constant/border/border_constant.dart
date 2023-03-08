import 'package:flutter/material.dart';

class BorderConstant{
  static BorderConstant instance = BorderConstant._init();
  BorderConstant._init();
  //singleton yapı olduğu için constructordan türeyemez. _init yaparak dışarıya kapatarak kullanıyoruz.

  BorderRadius get borderRadiusCircular10 => BorderRadius.circular(10);
  BorderRadius get borderRadiusCircular20 => BorderRadius.circular(20);
  Radius get radiusCircular30 => const Radius.circular(30);
}