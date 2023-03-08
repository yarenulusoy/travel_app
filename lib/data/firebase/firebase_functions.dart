import 'dart:async';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:uuid/uuid.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import '../../view/post/post_model.dart';
import '../sqlite/user_model.dart';

class FirebaseFunctions {
  final FirebaseFirestore _firebaseFirestore = FirebaseFirestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseStorage _storage = FirebaseStorage.instance;
  var isLoading = false;
  late String downloadURL;

  String generateId() {
    return const Uuid().v1();
  }

  Future<void> createUser( String mail) async {
    await _firebaseFirestore
        .collection('users')
        .doc(_auth.currentUser!.uid)
        .collection('details')
        .doc(_auth.currentUser!.uid)
        .set({
      "user_id": _auth.currentUser!.uid,
      "name": "",
      "mail": mail,
      "tel": "",
    });
  }

  Future<void> addPost(String title, String description, List<XFile> image,
      String categoryName,String location,String city) async {
    try {
      String id = generateId();
      String? imageUrl;
      DateTime time = DateTime.now();
      for (int i = 0; i < image.length; i++) {
        imageUrl = await uploadImage(image[i], id);
      }

      Map<String, dynamic> postDetails = {
        'id': id,
        'title': title,
        'description': description,
        'time': time,
        "location": location,
        "city":city,
        "categoryName": categoryName
      };

      await _firebaseFirestore
          .collection('posts')
          .doc(id)
          .set(postDetails)
          .then((value) {
        saveUserToPosts(id);
      });
    } catch (e) {}
  }
  Future<void> addFavorite(String post_id) async {
    //gönderileri favorilere ekle
    try {
      String id = generateId();
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('myfavorites')
          .doc(post_id)
          .set({
        'post_id': post_id,
      });
    } catch (e) {}
  }

  Future<void> addComments(String post_id,String comment) async {
    try {
      String id = generateId();
      await _firebaseFirestore
          .collection('comments')
      //    .doc(_auth.currentUser!.uid)
          .doc(id)
          .set({
        'post_id': post_id,
        'comment':comment,
        "user_id":_auth.currentUser!.uid
      });

    } catch (e) {}
  }

  Future<List> getCommentsList(String post_id) async {
    try {
      var querySnapshot = await _firebaseFirestore
          .collection('comments')
          .where("post_id", isEqualTo: post_id)
          .get();
      return querySnapshot.docs.map((e) => e.data()['comment']).toList();
    } catch (e) {
      return [];
    }
  }
  Future<List> getFavouriteList() async {
    try {

      var querySnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('myfavorites')
          .get();


      return querySnapshot.docs.map((e) => e.data()['post_id']).toList();
    } catch (e) {
      return [];
    }
  }
  Future<List> getPostList(String categoryName) async {
    try {
      var querySnapshot = await _firebaseFirestore
          .collection('posts')
          .where("categoryName", isEqualTo:categoryName)
          .get();

      return querySnapshot.docs.map((e) => e.data()['id']).toList();
    } catch (e) {
      return [];
    }
  }
  Future<bool> searchFavorite(String post_id) async {
    try {
      var querySnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('myfavorites')
          .doc(post_id).get();

      if(querySnapshot.data()==null){
        return false;
      }
      else{
        return true;
      }
    } catch (e) {
      return false;
    }
  }
  Future<void> deleteFavorite(String post_id) async {
    try {
      await _firebaseFirestore
          .collection('users')
      //    .doc(_auth.currentUser!.uid)
          .doc(_auth.currentUser!.uid)
          .collection('myfavorites')
          .doc(post_id)
          .delete();

    } catch (e) {}
  }
  Future<void> saveUserToPosts(String id) async {
    try {
      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          //.doc("VJxPtMWrn1fLyPfXFYmVW0WixrA3")
          .collection('mypost')
          .doc(id)
          .set({
        'id': id,
      });

    } catch (e) {}
  }

  Future<String> uploadImage(XFile file, String id) async {
    try {
      String imageName = generateId();

      var refrence = _storage
          .ref()
          .child("/images")
          .child("/$id")
          .child("/$imageName.jpg");

      var uploadTask = await refrence.putFile(File(file.path));

      String url = await uploadTask.ref.getDownloadURL();

      return url;
    } catch (e) {
      return "";
    }
  }

  Future<List<PostModel>> getAllPost() async {
    //tüm postlar
    return await _firebaseFirestore
        .collection('posts')
        .limit(5)
        .get()
        .then((value) {
      return value.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
  }

  Future<List<PostModel>> getPost(String categoryName) async {
    //kategoriye göre postlar
    return await _firebaseFirestore
        .collection('posts')
        .where("categoryName", isEqualTo: categoryName)
        //.orderBy('time')
        .get()
        .then((value) {
      return value.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
  }
  Future<List<PostModel>> searchPost(String search) async {
    search=search.toTitleCase();
    List<Object> sch=[];
    sch.add(search);
    return await _firebaseFirestore
        .collection('posts')
        .orderBy("title").startAt(sch)
    //.orderBy('time')
        .get()
        .then((value) {
      return value.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
  }
  Future<List<PostModel>> getPostId(String post_id) async {
    return await _firebaseFirestore
        .collection('posts')
        .where("id", isEqualTo:post_id)
    //.orderBy('time')
        .get()
        .then((value) {
      return value.docs.map((e) => PostModel.fromJson(e.data())).toList();
    });
  }
  Future<List> mygetPost() async {
    try {
      var querySnapshot = await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('mypost')
          .get();

      return querySnapshot.docs.map((e) => e.data()['id']).toList();
    } catch (e) {
      return [];
    }
  }

  Future<List> getImageUrl(String post_id) async {
    List<Map> files = [];
    List<String> imageUrlList = [];
    final ListResult result =
        await FirebaseStorage.instance.ref("images/$post_id").listAll();
    final List<Reference> allfiles = result.items;
    await Future.forEach(allfiles, (Reference file) async {
      final String fileUrl = await file.getDownloadURL();

      files.add({
        "url": fileUrl,
      });
    });
    return files;
  }
  Future<void> updateUserDetail(String name,String tel) async {
    try {

      await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('details')
          .doc(_auth.currentUser!.uid)
          .update(
            {"name":name,"tel":tel});
      }
     catch (e) {}
  }
  Future<List> getUserDetail() async {

      return await _firebaseFirestore
          .collection('users')
          .doc(_auth.currentUser!.uid)
          .collection('details')
          .where("user_id",isEqualTo: _auth.currentUser!.uid)
          .get()
          .then((value) {
           return value.docs.map((e) => UserModel.fromJson(e.data())).toList();
    });
  }

}
