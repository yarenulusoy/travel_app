import 'package:cloud_firestore/cloud_firestore.dart';

class PostModel {
  late String? id, title, description, categoryName, location, city;
  late Timestamp? time;

  PostModel({
    required this.id,
    required this.location,
    required this.city,
    required this.time,
    required this.description,
    required this.title,
    required this.categoryName,});


  PostModel.fromJson(Map<String, dynamic> map) {
    id = map['id'];
    location = map["location"];
    city = map["city"];
    time = map['time'];
    title = map['title'];
    description = map['description'];
    categoryName = map['categoryName'];
  }
}