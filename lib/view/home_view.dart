import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/post/add_post_view.dart';
import 'package:travel_app/view/profile/profile_setings_view.dart';
import 'package:travel_app/widgets/appbar/appbar_widget.dart';
import '../data/firebase/firebase_functions.dart';
import '../widgets/bottom_appbar_widget.dart';
import '../widgets/drawer/drawer_widget.dart';
import 'favorite/favorite_posts.dart';
import 'home/home_content_view.dart';


class HomeView extends StatefulWidget {
  HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}
List favoriteList=[];

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
      width: context.dynamicHeight(1),
      height: context.dynamicHeight(1),
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          appBar: AppBarWidget(),
          drawer: DrawerWidget(),
          backgroundColor: context.theme.canvasColor,
          bottomNavigationBar: BottomAppBarWidget(),
          body: TabBarView(
            children: [
              HomeContentView(),
              PostAddView(),
              FavoritePost(),
              ProfileSettingsView(),
            ],

          ),
        ),
      ),
    );
  }
}
