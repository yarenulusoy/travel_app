import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';

import '../../core/base/base_state.dart';
import '../images/jpg_image.dart';

class PopularPlacesCardWidget extends StatelessWidget with BaseState {
  PopularPlacesCardWidget(
      {Key? key,
      required this.title,
      required this.rating,
      required this.image})
      : super(key: key);

  final String title;
  final String rating;
  final String image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: context.dynamicWidth(widthConstant.widthPoint5),
        child: Card(
          //semanticContainer: true, //işe yaramıyor gibi
          child: Stack(
            children: [
              Positioned.fill(
                child: JpgImage(path: image),
              ),
              Positioned(
                  bottom: context.highValue,
                  left: context.lowValue,
                  child: positionedContainer(Text(title),context)),
              Positioned(
                  bottom: context.normalValue,
                  left: context.lowValue,
                  child: positionedContainer(Text("*$rating"),context)),
              Positioned(
                  width: 30,
                  top: context.lowValue,
                  right: context.normalValue,
                  child: const CircleAvatar(
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.add,
                        color: Colors.red,
                      ))),
            ],
          ),
        ));
  }

  Container positionedContainer(Widget widget,BuildContext context) {
    return Container(
      padding: paddingConstants.paddingHorizontal15 +
          paddingConstants.paddingVertical5,
      decoration: BoxDecoration(
          borderRadius:context.radiusNormal ,
          color: Colors.red),
      child: widget,
    );
  }
}
