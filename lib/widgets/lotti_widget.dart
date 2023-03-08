
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../core/constant/app/app_constant.dart';

class LottieWidget extends StatelessWidget {
   LottieWidget({Key? key,required this.name}) : super(key: key);
  String name;
  @override
  Widget build(BuildContext context) {
    return Lottie.asset(ApplicationConstant.LOTTIE_PATH+name);
  }
}
