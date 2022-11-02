import 'package:flutter/material.dart';
import 'package:travel_app/view/home/home_view.dart';
import 'package:travel_app/view/login/login_screen.dart';
import 'core/base/base_state.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget with BaseState{
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Travel App',
      theme: ThemeData(
        cardTheme: CardTheme(shape: RoundedRectangleBorder(
            borderRadius: borderConstant.borderRadiusCircular20),
          elevation: 5,
          clipBehavior: Clip.antiAliasWithSaveLayer,
        ),
        primarySwatch: Colors.blue,
      ),
      home:  const LoginScreen(),
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
    return Container();
  }
}



