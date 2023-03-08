import 'package:flutter/material.dart';

import '../../core/base/base_state.dart';

class JpgImage extends StatelessWidget with BaseState {
  JpgImage({Key? key,required this.path,this.boxFit}) : super(key: key);

  final String path;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/images/jpg/${path}.jpg",fit: boxFit ?? BoxFit.fill);
  }
}
