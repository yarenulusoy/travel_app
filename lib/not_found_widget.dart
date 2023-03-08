import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/widgets/constant/lottie/lottie_path.dart';
import 'package:travel_app/widgets/lotti_widget.dart';
import 'core/base/base_state.dart';

class NotFoundWidget extends StatelessWidget with BaseState {
  NotFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            LottieWidget(name: Lottie_Constant.NO_CONNECTION_LOTTIE),
            SizedBox(height: 50),
           const Text(
              "İnternet Yok",
              style: TextStyle(fontSize: 32),
            ),
          ],
        ),
      ),
    );
  }
}
