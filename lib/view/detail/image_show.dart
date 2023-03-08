import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/detail/detail_page.dart';

import '../../core/base/base_state.dart';
import '../../core/widget/divider/divider_widget.dart';
import '../../core/widget/image/image_widget.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/constant/icons/icon_path.dart';
import '../post/image_model.dart';
import '../post/post_model.dart';


class ImageShowView extends StatefulWidget{
  ImageShowView({Key? key,required this.imageList,required this.selectedImage}) : super(key: key);
  List<dynamic> imageList;
  int selectedImage;


  @override
  State<ImageShowView> createState() => _ImageShowViewState();
}

class _ImageShowViewState extends State<ImageShowView> with BaseState {
  final FirebaseFunctions _functions = FirebaseFunctions();
  List<PostModel> popularPlaces = [];
  List<ImageModel> imageUrlList = [];
  int say=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  void getData() async {
    //popularPlaces.addAll(await _functions.getAllPost());

    print("a");
    print(popularPlaces[0].title);
  }


  @override
  Widget build(BuildContext context) {
    final String image = widget.imageList[widget.selectedImage]["url"];

    var getScreenHeight = MediaQuery
        .of(context)
        .size
        .height;
    return Scaffold(
      body: Padding(
        padding: paddingConstants.paddingHorizontal15,
        child: Center(
          child: CarouselSlider(
              options: CarouselOptions(
                  height: getScreenHeight, viewportFraction: 1.0),
              items:
              [
                for (int i=widget.selectedImage; i<widget.imageList.length;i++)
                  MyImageView(widget.imageList[i]["url"]),
                for (int i=0; i<widget.selectedImage;i++)
                  MyImageView(widget.imageList[i]["url"]),

              ],
          ),
        ),
      ),
    );
  }
}
class MyImageView extends StatelessWidget{

  String imgPath;

  MyImageView(this.imgPath);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
        child: InteractiveViewer(
            boundaryMargin: const EdgeInsets.all(20.0),
            minScale: 0.1,
            maxScale: 1.6,
            child: Image.network(imgPath,fit: BoxFit.contain,)
        )
    );
  }

}

