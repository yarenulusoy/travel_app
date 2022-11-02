import 'package:flutter/material.dart';

class SizedBoxWidget extends StatelessWidget {
  SizedBoxWidget({Key? key, this.width, this.height}) : super(key: key);
  double? width, height;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
    );
  }
}
