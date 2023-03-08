import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/home/search_state.dart';
import 'package:travel_app/view/home_view.dart';
import '../../core/base/base_state.dart';
import '../../view/home/home_content_view.dart';

class AppBarWidget extends StatefulWidget with PreferredSizeWidget {
  AppBarWidget({Key? key}) : super(key: key);

  @override
  State<AppBarWidget> createState() => _AppBarWidgetState();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class _AppBarWidgetState extends State<AppBarWidget> with BaseState {
  bool search = false;
  late String searchName= Provider.of<SearchState>(context).search;

  void degerDondur(bool deger) {
    setState(() {
      deger = !deger;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: search
          ?  Consumer<SearchState>(
        builder: (context, sayacModelNesne, child) { return TextField(
              decoration: const InputDecoration(
                hintText: "Mekan Ara",
                filled: false,
                border: InputBorder.none,
                enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.red)),
              ),
        onChanged: (val) {
          setState(() {
            sayacModelNesne.search=val;
          });

        },
    );}
            ): Text(
              "Geziyooo",
            ),
      actions: [
    Consumer<SearchState>(
    builder: (context, searchObject, child) {
      return Padding(
        padding: context.paddingLow,
        child: search
            ? IconButton(
            onPressed: () {
              setState(() {
                search = false;
                searchObject.search_click=false;
                searchObject.search = "";
                Navigator.push(context, MaterialPageRoute(builder: (context) =>HomeView()));

              });
            },
            icon: Icon(Icons.cancel))
           : IconButton(
            onPressed: () {
              setState(() {
                searchObject.search_click=true;
                search = true;
              });
            },
            icon: Icon(Icons.search)),
      );
    }
    ),
      ],
    );
  }
}
