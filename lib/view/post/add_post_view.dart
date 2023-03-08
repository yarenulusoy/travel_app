import 'dart:io';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:place_picker/entities/location_result.dart';
import 'package:place_picker/widgets/place_picker.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import '../../core/base/base_state.dart';
import '../../data/firebase/firebase_functions.dart';



class PostAddView extends StatefulWidget {
  const PostAddView({Key? key}) : super(key: key);

  @override
  State<PostAddView> createState() => _PostAddViewState();
}

class _PostAddViewState extends State<PostAddView> with BaseState {
  List<String> location=[];
  List<String> city=[];
  List<XFile> selectedFiles=[];
  final ImagePicker _picker=ImagePicker();


  Future<void> createPost(title,description,categoryName) async{
    final FirebaseFunctions _functions = FirebaseFunctions();
    if (title.text.isNotEmpty && description.text.isNotEmpty) {
      await _functions
          .addPost(title.text, description.text,selectedFiles,dropdownvalue,location[0],city[0])
          .then((value) {
        print("success");
        location.clear();
      });

    } else {
      print("Tüm Alanları Doldurun");
    }
  }

  Future<void> pickImage() async {
    if(selectedFiles !=null){
      selectedFiles.clear();
    }
    try {
      final List<XFile>? img = await _picker.pickMultiImage();
      if (img!.isNotEmpty) {
        setState(() {
          selectedFiles.addAll(img);
        });

      }
      print("secildi");
    }catch(e){
      print(e);
    }
  }
  Future<LocationResult?> showPlacePicker() async {
    //konum seçme
    LocationResult? result = await Navigator.of(context).push(
        MaterialPageRoute(builder: (context) => PlacePicker("AIzaSyCk7x6Xc6CUA0RTsy1wD1_bt3SFSLULj50")));
   return result;
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
  /*
  late GoogleMapController mapController;

  final LatLng _center = const LatLng(45.521563, -122.677433);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }
  void showPlacePicker() async {
    LocationResult result = await Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            PlacePicker("AIzaSyCk7x6Xc6CUA0RTsy1wD1_bt3SFSLULj50",
              displayLocation:_center,
            )));

    // Handle the result in your way
    print(result);
  }*/

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    String? a;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              width: context.dynamicWidth(0.9),
              height: context.dynamicHeight(0.9),
              child: Column(
                children: [
                  AutoSizeText(
                    "Yeni Mekan Ekle",
                    style: textThemeLight.headline6,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: AlignWidget(
                        child: AutoSizeText(
                          "Konum Seç",
                          style: textThemeLight.headline6,
                        )),
                  ),
                  Align(
                    alignment: FractionalOffset.centerLeft,
                    child: ElevatedButton(onPressed: () async {
                      showPlacePicker().then((LocationResult? result){
                        setState(() {
                         location.add(result!.name.toString());
                         city.add(result!.locality.toString());
                        });
                      });
                    },

                      child:
                       Text("Konum Seç")



                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: AlignWidget(
                        child: AutoSizeText(
                          "Yer Adı",
                          style: textThemeLight.headline6,
                        )),
                  ),
                  TextField(
                    controller: titleController,
                    decoration: InputDecoration(border: OutlineInputBorder()),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15, bottom: 10),
                    child: AlignWidget(
                        child: AutoSizeText(
                          "Açıklama",
                          style: textThemeLight.headline6,
                        )),
                  ),
                  Container(
                      child: SizedBox(

                          child: TextFormField(
                            controller: descriptionController,
                            keyboardType: TextInputType.multiline,
                            minLines: 4,
                            maxLines: null,
                            decoration: InputDecoration(
                              border: OutlineInputBorder(),
                            ),
                          ))),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: AlignWidget(
                        child: AutoSizeText(
                          "Kategori Seç",
                          style: textThemeLight.headline6,
                        )),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      width: 350,
                      height: 40,
                      child: DropdownButton(
                        value: dropdownvalue,
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState((){
                            dropdownvalue=newValue!;
                          });
                        },
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 15),
                    child: AlignWidget(
                        child: AutoSizeText(
                          "Fotograf Ekle",
                          style: textThemeLight.headline6,
                        )),
                  ),
                  Row(
                    children: [
                      AlignWidget(child: ElevatedButton(
                          onPressed: () {
                            pickImage();
                          }, child: Text("Resim Seç"))),
                      SizedBox(width: 10,),
                    ],
                  ),
                  Container(
                    width: context.dynamicWidth(widthConstant.width1),
                    height: context.dynamicHeight(heightConstant.heightPoint15),
                    child: Stack(
                      alignment: AlignmentDirectional.center,
                      children: [
                        SizedBox(
                          height: context.dynamicHeight(heightConstant.heightPoint10),
                          child: ListView.builder(
                            itemBuilder: (context, int index) {
                              return selectedFiles.length==0? SizedBox()
                                :SizedBox(
                                width: context.dynamicWidth(widthConstant.widthPoint27),
                                child: Padding(
                                  padding: paddingConstants.paddingHorizontal15,
                                  child: Card(child:
                                  Image.file(File(selectedFiles[index].path),
                              fit: BoxFit.cover,),
                                ),
                              ),
                              );
                            },
                            itemCount: selectedFiles.length,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ],
                    ),
                  ),



                  ElevatedButton(onPressed: () {
                    createPost(titleController,descriptionController,dropdownvalue);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                      content: Text("Eklendi"),
                    ));
                  }, child: Text("PAYLAŞ"))
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AlignWidget extends Align {
  AlignWidget({Key? key, Alignment? alignment, required Widget child})
      : super(key: key, alignment: alignment ?? Alignment.centerLeft, child: child);
}


String dropdownvaluekonum = 'Kocaeli';

String dropdownvalue = 'Kafeler';

var items = [
  'Kafeler',
  'Müzeler',
  'Sahiller',
   'Camiler',
];



