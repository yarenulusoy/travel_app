import 'package:flutter/material.dart';

class SearchState with ChangeNotifier {
  String search="";
  bool search_click=false;

  bool searchClick() {
    return search_click;
  }
  String searchText() {
    return search;
  }
  void searchNotify(){
    search_click=search_click;
    search=search;
    notifyListeners();
  }

}
