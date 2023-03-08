import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/detail/image_show.dart';
import 'package:travel_app/view/home/search_state.dart';
import 'package:travel_app/widgets/appbar/appbar_widget.dart';
import '../../core/base/base_state.dart';
import '../../core/widget/divider/divider_widget.dart';
import '../../core/widget/sizedbox/sizedbox_widget.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/constant/icons/icon_path.dart';
import '../post/image_model.dart';
import '../post/post_model.dart';
import 'map_view.dart';

class DetailPage extends StatefulWidget {
  PostModel placesList;
  String? post_id;
  DetailPage({Key? key, required this.placesList, required this.post_id})
      : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> with BaseState {
  final FirebaseFunctions _functions = FirebaseFunctions();
  List<ImageModel> imageUrlList = [];
  late List<dynamic> images = [];

  void getImages() async {
    images.addAll(await _functions.getImageUrl(widget.post_id!));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getImages();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(),
      body: SingleChildScrollView(
          child: Column(children: [
        //Üst kısım
        Padding(
          padding: const EdgeInsets.only(top:20),
          child: Container(
            width: context.dynamicWidth(widthConstant.widthPoint8),
            height: context.dynamicHeight(heightConstant.heightPoint35),
            child: Card(
              child: Stack(
                children: [
                  Positioned.fill(
                    child:
                    GestureDetector(
                      child: FutureBuilder(
                          future: _functions.getImageUrl(widget.post_id!),
                          builder: (context, snapshot) {
                            if (snapshot.hasError) {
                              return const Text("Hata oluştu");
                            }
                            if (snapshot.connectionState ==
                                ConnectionState.done) {
                              images = snapshot.data as List;
                              return Image.network(images[0]["url"],fit: BoxFit.cover,);
                            }
                            return Center(
                                child: CircularProgressIndicator());
                          }),
                      onTap: (){
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => ImageShowView(
                                    imageList: images, selectedImage: 0)));
                      },
                    ),


                  ),
                ],
              ),
            ),
          ),
        ),

        const SizedBoxWidget(),

        //Ortadaki resimler 10 tane
        Container(
          width: context.dynamicWidth(widthConstant.width1),
          height: context.dynamicHeight(heightConstant.heightPoint15),
          child: Stack(
            alignment: AlignmentDirectional.center,
            children: [
              SizedBox(
                height: context.dynamicHeight(heightConstant.heightPoint10),
                child: FutureBuilder(
                    future: _functions.getImageUrl(widget.post_id!),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return const Text("Hata oluştu");
                      }
                      if (snapshot.connectionState == ConnectionState.done) {
                        images = snapshot.data as List;
                        return ListView.builder(
                          itemCount: images.length,
                          itemBuilder: (context, int index) {
                            if (index > 0) {
                              final Map image = images[index];
                              return GestureDetector(
                                child: SizedBox(
                                  width: context
                                      .dynamicWidth(widthConstant.widthPoint27),
                                  child: Padding(
                                    padding: paddingConstants.paddingHorizontal15,
                                    child: Card(
                                      child: GestureDetector(
                                        child: Image.network(image["url"],fit: BoxFit.cover,),
                                        onTap: () {
                                          Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ImageShowView(
                                                          imageList: images,
                                                          selectedImage: index)));
                                        },
                                      ),
                                    ),

                                  ),
                                ),
                              );
                            }
                            return SizedBox();
                          },
                          scrollDirection: Axis.horizontal,
                        );
                      }
                      return Center(child: CircularProgressIndicator());
                    }),
              ),
            ],
          ),
        ),

        const DividerWidget(),

        ListTile(
          title: AutoSizeTextWidget(
            title: widget.placesList.title.toString(),
            style: textThemeLight.headline5.copyWith(color: Colors.black),
            maxLines: 1,
          ),
          subtitle: AutoSizeTextWidget(
            title: "${widget.placesList.city.toString()}",
            style: textThemeLight.subtitle1.copyWith(color: Colors.black),
            maxLines: 1,
          ),

          trailing: InkWell(
            child: Icon(
              IconsConstant.MAP_LOCATION_ICON,
              size: 30,
              color: Colors.black,

            ),
            onTap: (){
              String location="${widget.placesList.location.toString() + " " + widget.placesList.city.toString()}";
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          MapView(location: location)));

            },
          ),
        ),
        Padding(
          padding: paddingConstants.paddingHorizontal15,
          child: AutoSizeTextWidget(
            title: widget.placesList.description.toString(),
            style: textThemeLight.subtitle2
                .copyWith(fontWeight: FontWeight.normal),
          ),
        ),
        const SizedBoxWidget(),
        /*
        Container(
         child: Column(
            children: [
              AutoSizeText(
                "Yorum Yap",
                style: textThemeLight.headline6,
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller:commentController,
                keyboardType: TextInputType.multiline,
                minLines: 4,
                maxLines: null,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                ),
              ),
            ),
              ElevatedButton(onPressed: (){_functions.getCommentsList(widget.post_id!);}, child: Text("PAYLAŞ")),
            ],
          ),

    ),*/
SizedBox(height: 100,),
        /*
        Container(
            child: AutoSizeTextWidget(
                title: "Yorumlar", style: textThemeLight.headline5)),
        Container(
          width: context.dynamicWidth(0.9),
          height: context.dynamicHeight(0.3),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                margin: paddingConstants.paddingVertical10,
                color: context.theme.cardColor,
                child: Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                          child: ImageWidget(path: "dolmabahce.jpg")),
                      title: Text("Yaren Ulusoy"),
                    ),
                    Padding(
                      padding: paddingConstants.paddingAll10,
                      child: Text(
                          "Çok güzel bir mekandı. Çok beğendim. Herkesin gitmesini tavsiye ediyorum.,"
                          " güzel bir mekandı. Çok beğendim. Herkesin gitmesini tavsiye ediyorum."),
                    ),

                  ],
                ),
              );
            },
            itemCount: 5,
          ),
        ),*/


      ])),
    );
  }
}
