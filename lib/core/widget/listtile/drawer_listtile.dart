import 'package:flutter/material.dart';

//Atomic Widget
class DrawerListTile extends ListTile {
  DrawerListTile(
      {Key? key,
        required Widget title,
        Widget? leading,
        VoidCallback? onTap,
        Color? selectedColor,
        Color? iconColor,
        Color? selectedTileColor,
        Color? tileColor,
        EdgeInsets? contentPadding})
      : super(
      key: key,
      contentPadding: contentPadding,
      iconColor: iconColor,
      selectedTileColor: selectedTileColor,
      title: title,
      leading: leading,
      selectedColor: selectedColor,
      tileColor: tileColor,
      onTap: onTap);
}