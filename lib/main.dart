import 'package:flutter/material.dart';
import 'package:travel_app/screens/login_screen.dart';
import 'package:travel_app/screens/main_screen.dart';
import 'package:travel_app/screens/register_screen.dart';

import 'package:travel_app/widgets/text_field/login_text.dart';

import 'widgets/button/login_button.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Gez Gel',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MainScreen()
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container();
  }
}



