
import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';

import '../../../core/base/base_state.dart';
import '../../../data/firebase/firebase_functions.dart';
import '../../../widgets/auto_size_text/auto_size_text_widget.dart';

class PlacesCardWidget extends StatefulWidget with BaseState {
  PlacesCardWidget(
      {Key? key,
        required this.title,
        required this.city,
        required this.post_id})
      : super(key: key);
  final String post_id;
  final String title;
  final String city;


  @override
  State<PlacesCardWidget> createState() =>
      _PlacesCardWidgetState();
}

class _PlacesCardWidgetState extends State<PlacesCardWidget>
    with BaseState {
  @override
  Widget build(BuildContext context) {
    bool isFavoriteControl = false;
    final FirebaseFunctions _functions = FirebaseFunctions();
    late List<dynamic> images = [];

    return SizedBox(
        width: context.dynamicWidth(widthConstant.widthPoint5),
        child: Card(
          child: Stack(
            children: [
              Positioned.fill(
                child: FutureBuilder(
                    future: _functions.getImageUrl(widget.post_id),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Hata oluştu");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        images = snapshot.data as List;
                        return Image.network(images[0]["url"],fit: BoxFit.cover,);
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
              Positioned(
                  bottom: positionedConstant.positioned40,
                  left: positionedConstant.positioned5,
                  child: _positionedContainer(
                      AutoSizeTextWidget(
                        title: widget.title,
                        style: textThemeLight.subtitle2
                            .copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                      context)),
              Positioned(
                  bottom: positionedConstant.positioned10,
                  left: positionedConstant.positioned5,
                  child: _positionedContainer(
                      AutoSizeTextWidget(
                        title: widget.city,
                        style: textThemeLight.subtitle2
                            .copyWith(color: Colors.white),
                        maxLines: 1,
                      ),
                      context)),
              Positioned(
                  top: positionedConstant.positioned5,
                  right: positionedConstant.positioned10,
                  child: FutureBuilder(
                      future: _functions.searchFavorite(widget.post_id),
                      builder: (context, snapshot) {
                        if (snapshot.hasError) {
                          return const Text("Hata oluştu");
                        }
                        if (snapshot.connectionState == ConnectionState.done) {
                          isFavoriteControl = snapshot.data!;
                          print(isFavoriteControl);
                          return FavoriteButton(
                            isFavorite: isFavoriteControl,
                            valueChanged: (_isFavorite) {
                              if (_isFavorite == true) {
                                _functions.addFavorite(widget.post_id);
                              }
                              if (_isFavorite == false) {
                                _functions.deleteFavorite(widget.post_id);
                              }
                            },
                          );
                        }
                        return Center(child: CircularProgressIndicator());
                      })),
            ],
          ),
        ));
  }

  Container _positionedContainer(Widget widget, BuildContext context) {
    return Container(
      padding: paddingConstants.paddingHorizontal15 +
          paddingConstants.paddingVertical5,
      decoration: BoxDecoration(
          color: Colors.grey.withOpacity(0.75),
          borderRadius: context.radiusLow),
      child: widget,
    );
  }
}