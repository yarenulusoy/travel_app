import 'package:cloud_firestore/cloud_firestore.dart';

import 'image_model.dart';

class ImageModel {
  late String? post_id,url;

  ImageModel({
    required this.post_id,
    required this.url});


  ImageModel.fromJson(Map<String, dynamic> map) {
    post_id = map['post_id'];
    url=map["url"];
  }





}
