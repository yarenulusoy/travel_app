import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/home/widget/places_card_widget.dart';

import '../../../core/base/base_state.dart';
import '../../../data/firebase/firebase_functions.dart';
import '../../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../detail/detail_page.dart';
import '../home_content_view.dart';

class SearchPlacesCard extends StatefulWidget {
  String search;
  SearchPlacesCard ({Key? key,required this.search})
      : super(key: key);

  @override
  State<SearchPlacesCard> createState() => _SearchPlacesCardState();
}

class _SearchPlacesCardState extends State<SearchPlacesCard> with BaseState{
  @override
  Widget build(BuildContext context) {
    final FirebaseFunctions _functions = FirebaseFunctions();
    List idList=[];
    return Center(
      child: Container(
        //Kafeler kısmı
        width:MediaQuery.of(context).size.width/2,
        height: context.dynamicHeight(heightConstant.heightPoint35),
        decoration: const BoxDecoration(color: Colors.transparent),
        child: Padding(
          padding: EdgeInsets.only(top:20),
            child: searchPlacesListviewBuilder(context),
            ),
      ),
    );
  }

  FutureBuilder<Object?> searchPlacesListviewBuilder(BuildContext context) {
    final FirebaseFunctions _functions = FirebaseFunctions();
    List otherPlacesList=[];
    return FutureBuilder(
        future:_functions.searchPost(widget.search),
        builder: (context,snapshot){
          if(snapshot.hasError){
            return const Text("Hata oluştu");
          }
          if(snapshot.connectionState==ConnectionState.done){
            otherPlacesList=snapshot.data as List;
            return ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: otherPlacesList.length,
                itemBuilder: (BuildContext context, int index) {
                  var post = otherPlacesList[index];
                  return Padding(
                    padding: paddingConstants.paddingOnlyRight15,
                    child: GestureDetector(
                      onTap: (){
                        String? post_id=otherPlacesList[index].id;
                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(placesList:post,post_id:post_id)));
                      },
                      child: PlacesCardWidget(
                        post_id:otherPlacesList[index].id.toString(),
                        title: otherPlacesList[index].title.toString(),
                        city: otherPlacesList[index].city.toString(),
                      ),
                    ),
                  );
                });

          }
          return Center(child: CircularProgressIndicator());

        }

    );
  }
}
