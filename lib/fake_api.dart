import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:travel_app/view/post/post_model.dart';

import 'data/firebase/firebase_functions.dart';
/*
class popularPlaces{


  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseFunctions _functions = FirebaseFunctions();
  List<PostModel> posts = [];


  void getData() async {
    posts.addAll(await _functions.getAllPosts());

  }

*/













List<dynamic> popularPlaces = [
  {
    "title":"Dolmabahçe Sarayı",
    "rating":"4.9",
    "imagePath":"dolmabahce.jpg"
  },
  {
    "title":"Galata Kulesi",
    "rating":"4.5",
    "imagePath":"galata.jpg"
  },
  {
    "title":"Yerebatan Sarnıcı",
    "rating":"4.0",
    "imagePath":"dolmabahce.jpg"
  },
];


List<dynamic> cafes = [
  {
    "title":"Chocolabs",
    "imagePath":"galata.jpg",
    "location":"İzmit,Kocaeli"
  },
  {
    "title":"Burger Yiyelim",
    "imagePath":"dolmabahce.jpg",
    "location":"Gebze,Kocaeli"
  },
  {
    "title":"KFC",
    "imagePath":"dolmabahce.jpg",
    "location":"Pendik,İstanbul"
  },
  {
    "title":"Sbarro",
    "imagePath":"galata.jpg",
    "location":"Kartal,İstanbul"
  },
];




