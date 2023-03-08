import 'package:flutter/material.dart';

class DividerWidget extends Divider {
  const DividerWidget({Key? key, double? height, double? thickness})
      : super(key: key, height: height ?? 10, thickness: thickness ?? 2);
}
