import 'package:favorite_button/favorite_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/detail/detail_page.dart';
import 'package:travel_app/view/favorite/favorite_posts.dart';
import 'package:travel_app/view/home/search_state.dart';
import 'package:travel_app/view/home/widget/places_card_widget.dart';
import 'package:travel_app/view/home/widget/search_places_card.dart';
import '../../core/base/base_state.dart';
import '../../core/widget/divider/divider_widget.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/constant/icons/icon_path.dart';
import '../post/category_post.dart';
import '../post/image_model.dart';
import '../post/post_model.dart';

part 'home_string_values.dart';
part 'widget/popular_places_card_widget.dart';
part 'widget/other_places_card_widget.dart';
class HomeContentView extends StatefulWidget{
   HomeContentView({Key? key}) : super(key: key);

  @override
  State<HomeContentView> createState() => _HomeContentViewState();
}

class _HomeContentViewState extends State<HomeContentView> with BaseState {
  final FirebaseFunctions _functions = FirebaseFunctions();
  List<PostModel> popularPlaces = [];
  List<ImageModel> imageUrlList = [];
  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: paddingConstants.paddingHorizontal15,
      child: SingleChildScrollView(
        child:
        Consumer<SearchState>(builder: (context, searchObject, child) {
         if( searchObject.search!=""){
           return SearchPlacesCard(search:searchObject.searchText());
         }
       else{
         return Column(
             children: [
               // searchBar(context),
               Container(
                 //Populer Mekanlar
                 width: context.dynamicWidth(widthConstant.width1),
                 height: context.dynamicHeight(heightConstant.heightPoint35),
                 decoration: BoxDecoration(
                   borderRadius: context.radiusLow,
                   color: Colors.transparent,
                 ),
                 child: Padding(
                   padding: paddingConstants.paddingAll15,
                   child: _PopularPlacesWidget(),
                 ),
               ),
               const DividerWidget(),

               OtherPlacesCardWidget(categoryName: "Kafeler"),
               OtherPlacesCardWidget(categoryName: "Müzeler"),
               OtherPlacesCardWidget(categoryName: "Sahiller"),
               OtherPlacesCardWidget(categoryName: "Camiler"),

               /*OtherPlacesCardWidget(
              otherPlacesList: cafes,
              titleName: _HomeStringValues().MUSEUMS,
            ),*/
             ],
           );
         }
        }),
      ),
    );
  }

  SizedBox searchBar(BuildContext context) {
    return SizedBox(
      //search Çubugunun olduğu yer
      width: context.dynamicWidth(widthConstant.width1),
      height: context.dynamicHeight(heightConstant.heightPoint05),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(IconsConstant.LOCATION_ICON),
              AutoSizeTextWidget(
                title: "  KOCAELİ",
                style: context.textTheme.bodyText1,
                maxLines: 1,
              )
            ],
          ),
          Icon(IconsConstant.NOTIFICATION_ICON),
        ],
      ),
    );
  }
}


