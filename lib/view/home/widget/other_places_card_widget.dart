part of '../home_content_view.dart';

class OtherPlacesCardWidget extends StatefulWidget {
  String categoryName;
  OtherPlacesCardWidget({Key? key,required this.categoryName})
      : super(key: key);

  @override
  State<OtherPlacesCardWidget> createState() => _OtherPlacesCardWidgetState();
}

class _OtherPlacesCardWidgetState extends State<OtherPlacesCardWidget> with BaseState{
  @override
  Widget build(BuildContext context) {
    final FirebaseFunctions _functions = FirebaseFunctions();
    List idList=[];
    return Container(
      //Kafeler kısmı
      width: context.dynamicWidth(widthConstant.width1),
      height: context.dynamicHeight(heightConstant.heightPoint35),
      decoration: const BoxDecoration(color: Colors.transparent),
      child: Padding(
          padding: paddingConstants.paddingAll15,
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeTextWidget(
                        title: widget.categoryName,
                        style: textThemeLight.headline6.copyWith(fontWeight: FontWeight.normal),
                        maxLines: 1,
                      ),
                      TextButton(
                          onPressed: ()  async {
                            idList=await _functions.getPostList(widget.categoryName);
                              Navigator.push(context, MaterialPageRoute(builder: (context) =>CategoryPost(post_id: idList,categoryName: widget.categoryName,)));
                          },
                          child: AutoSizeTextWidget(
                            title: HomeStringValues().SHOW_ALL_OF_THEM,
                            style: textThemeLight.subtitle2,
                            maxLines: 1,
                          ))
                    ],
                  )),
              Expanded(flex: 7, child: otherPlacesListviewBuilder(context)),
            ],
          )),
    );
  }

  FutureBuilder<Object?> otherPlacesListviewBuilder(BuildContext context) {
    final FirebaseFunctions _functions = FirebaseFunctions();
    List otherPlacesList=[];
    return FutureBuilder(
        future: _functions.getPost(widget.categoryName),
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
