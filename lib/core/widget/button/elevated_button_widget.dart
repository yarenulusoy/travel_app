import 'package:flutter/material.dart';

class ElevatedButtonWidget extends ElevatedButton {
  const ElevatedButtonWidget(
      {Key? key, required VoidCallback onPressed, required Widget child, ButtonStyle? style})
      : super(key: key, onPressed: onPressed, child: child, style: style);
}
