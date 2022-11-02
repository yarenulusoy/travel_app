import 'package:flutter/material.dart';
import 'package:travel_app/constant/image_constant.dart';
import 'package:travel_app/widgets/card/home_popular_card_widget.dart';
import 'package:travel_app/widgets/sizedbox_widget.dart';
import 'package:travel_app/constant/width_constant.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/core/base/base_state.dart';

part 'home_string_values.dart';

class HomeView extends StatelessWidget with BaseState {
  HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: paddingConstants.paddingHorizontal15,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(  //search Çubugunun olduğu yer
                width: context.dynamicWidth(widthConstant.width1),
                height: context.dynamicHeight(heightConstant.heightPoint2),
                color: Colors.red,
              ),
              SizedBoxWidget(  //Search çubugu ile Populer mekanlar arasındaki boşluk
                height: context.dynamicHeight(heightConstant.heightPoint04),
              ),

              Container( //Populer Mekanlar
                width: context.dynamicWidth(widthConstant.width1),
                height: context.dynamicHeight(heightConstant.heightPoint35),
                decoration: BoxDecoration(
                  borderRadius: borderConstant.borderRadiusCircular20,
                  color: colorConstants.jordyBlue,
                ),
                child: Padding(
                  padding: paddingConstants.paddingAll15,
                  child: PopularPlacesWidget(
                      imageConstant: imageConstant,
                      widthConstant: widthConstant),
                ),
              ),

              SizedBoxWidget( //Popüler Mekanlar ile Kafeler arasındaki boşluk
                height: context.dynamicHeight(heightConstant.heightPoint025),
              ),

              Container( //Kafeler kısmı
                width: context.dynamicWidth(widthConstant.width1),
                height: context.dynamicHeight(heightConstant.heightPoint25),
                color: Colors.red,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PopularPlacesWidget extends StatelessWidget {
  const PopularPlacesWidget({
    super.key,
    required this.imageConstant,
    required this.widthConstant,
  });

  final ImageConstant imageConstant;
  final WidthConstant widthConstant;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            flex: 1,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  _HomeStringValues().popularPlaces,
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      _HomeStringValues().showAllOfThem,
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge
                          ?.copyWith(color: Colors.black),
                    ))
              ],
            )),
        Expanded(
            flex: 6,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                PopularPlacesCardWidget(
                    title: _HomeStringValues().dolmabahcePalace,
                    rating: _HomeStringValues().dolmabahceRating,
                    image: imageConstant.dolmabahce),
                SizedBoxWidget(
                  width: context.dynamicWidth(widthConstant.widthPoint05),
                ),
                PopularPlacesCardWidget(
                    title: _HomeStringValues().galataTower,
                    rating: _HomeStringValues().galataRating,
                    image: imageConstant.galata),
              ],
            )),
      ],
    );
  }
}
