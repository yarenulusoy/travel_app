import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:travel_app/view/favorite/favorite_posts.dart';
import 'package:travel_app/view/home/search_state.dart';
import 'package:travel_app/view/home_view.dart';
import 'package:travel_app/view/login/a.dart';
import 'package:travel_app/view/login/login_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:travel_app/view/post/post_model.dart';
import 'package:travel_app/view/profile/profile_posts.dart';
import 'package:travel_app/view/profile/profile_setings_view.dart';
import 'core/init/theme/app_theme_light.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}
class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context)=>SearchState()),
        ],
    child:MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: AppThemeLight.instance.theme,
      home: LoginView(),
      routes: {
        "/home":(context) => HomeView(),
        "/profile":(context) => ProfileSettingsView(),
        "/my_post":(context) => ProfilePost(),
        "/favorite":(context) => FavoritePost(),
      },
    ),
    );
  }
}
