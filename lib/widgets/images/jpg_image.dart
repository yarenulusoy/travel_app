import 'package:flutter/material.dart';
import 'package:travel_app/core/base/base_state.dart';

class JpgImage extends StatelessWidget with BaseState {
  JpgImage({Key? key,required this.path,this.boxFit}) : super(key: key);

  final String path;
  BoxFit? boxFit;

  @override
  Widget build(BuildContext context) {
    return Image.asset("${imageConstant.jpgBaseUrl}$path.jpg",fit: boxFit ?? BoxFit.fill);
  }
}
