import 'package:flutter/material.dart';

class TextFieldWidget extends TextField {
  TextFieldWidget({Key? key, required String hintText, TextEditingController? controller,required bool obscureText})
      : super(key: key, decoration: InputDecoration(hintText: hintText), controller: controller,obscureText: obscureText);
}
