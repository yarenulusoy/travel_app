import 'package:flutter/material.dart';

class IconButtonWidget extends IconButton {
  const IconButtonWidget({Key? key, required Widget icon, double? iconSize, required VoidCallback onPressed, double? iconPadding})
      : super(key: key, icon: icon, iconSize: iconSize, onPressed: onPressed);
}
