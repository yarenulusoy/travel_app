import 'package:flutter/material.dart';

import '../../core/base/base_state.dart';

class PngImage extends StatelessWidget with BaseState {
  PngImage({Key? key, required this.path, this.boxFit}) : super(key: key);

  final String path;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset("${""}$path.png", fit: boxFit ?? BoxFit.fill);}
}
