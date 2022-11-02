import 'package:flutter/material.dart';
import 'package:travel_app/core/base/base_state.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/widgets/images/jpg_image.dart';

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
                  bottom: positionedConstant.positioned40,
                  left: positionedConstant.positioned5,
                  child: positionedContainer(Text(title))),
              Positioned(
                  bottom: positionedConstant.positioned10,
                  left: positionedConstant.positioned5,
                  child: positionedContainer(Text("*$rating"))),
              Positioned(
                  width: 30,
                  top: positionedConstant.positioned5,
                  right: positionedConstant.positioned10,
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

  Container positionedContainer(Widget widget) {
    return Container(
      padding: paddingConstants.paddingHorizontal15 +
          paddingConstants.paddingVertical5,
      decoration: BoxDecoration(
          borderRadius: borderConstant.borderRadiusCircular20,
          color: Colors.red),
      child: widget,
    );
  }
}
