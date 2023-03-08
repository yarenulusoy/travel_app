import 'package:flutter/material.dart';
import 'package:travel_app/core/base/base_state.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../detail/detail_page.dart';
import '../home/home_content_view.dart';
import '../home/widget/places_card_widget.dart';

class ProfilePost extends StatefulWidget {
  ProfilePost({Key? key}) : super(key: key);
  @override
  State<ProfilePost> createState() => _ProfilePostState();
}
List favoriteList=[];
int sayac=0;
final FirebaseFunctions _functions = FirebaseFunctions();
class _ProfilePostState extends State<ProfilePost> with BaseState{
  Future<void> getFavorite() async{
    favoriteList=await _functions.mygetPost();
  }
  @override
  initState(){
    // TODO: implement initState
    super.initState();
    getFavorite();
  }
  final FirebaseFunctions _functions = FirebaseFunctions();
  List placesList = [];
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AutoSizeTextWidget(
                    title:HomeStringValues().MYPOST,
                    style:Theme.of(context).textTheme.headline5,
                    maxLines: 1,
                  ),
                ],
              )),
          Expanded(
            flex: 5,
            child: RefreshIndicator(
              onRefresh:() async {
                setState(()  {
                  getFavorite();
                });
              },
              child: FutureBuilder(
                future: getFavorite(),
                builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
                  return favoriteList.length!= 0 ? ListView.builder(
                      itemCount: favoriteList.length,
                      itemBuilder: (BuildContext context, int index) {
                        var id = favoriteList[index];
                        return FutureBuilder(
                            future: _functions.getPostId(id),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Hata oluştu");
                              }
                              if (snapshot.connectionState == ConnectionState.done) {
                                sayac=1;
                                placesList = snapshot.data as List;
                                var post=placesList[0];
                                return Container(
                                  child:  Padding(
                                    padding:
                                    paddingConstants.paddingOnlyRight15,
                                    child: GestureDetector(
                                      onTap: () {
                                        String? post_id=post.id;
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => DetailPage(placesList:post,post_id:post_id)));

                                      },
                                      child: Padding(
                                        padding: paddingConstants.paddingAll15,  child: Container(
                                        width: context.dynamicWidth(widthConstant.width1),
                                        height: context.dynamicHeight(heightConstant.heightPoint35),
                                        child: PlacesCardWidget(
                                          post_id: post.id.toString(),
                                          title: post.title.toString(),
                                          city:post.city.toString(),
                                        ),
                                      ),
                                      ),
                                    ),
                                  ),

                                );
                              }
                              return Center(child: CircularProgressIndicator());
                            });
                      }):  sayac==0 ? Text(""):Text("Gönderiniz Yoktur.");
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
