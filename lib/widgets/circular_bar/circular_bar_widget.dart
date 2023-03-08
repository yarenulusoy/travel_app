import 'package:flutter/material.dart';

import '../constant/lottie/lottie_path.dart';
import '../lotti_widget.dart';

class CircularBarWidget extends StatelessWidget {
  const CircularBarWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Align(
          alignment: Alignment.center,
          child: LottieWidget(name: Lottie_Constant.CIRCULAR_LOTTIE
          ),
        ),
      ),
    );
  }
}
