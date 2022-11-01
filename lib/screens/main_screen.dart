import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.symmetric(vertical: 20.0),
          height: 200.0,
          child: Container(
            color: Colors.blue,
            child: Container(
              color: Colors.red,
              child: Column(
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Deneme"),
                        Text("Deneme"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: ListView(
                      // This next line does the trick.
                      scrollDirection: Axis.horizontal,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Container(
                            width: 200,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: const DecorationImage(
                                image: AssetImage('assets/images/logo.jpg'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            child: Stack(
                              children: [
                                Positioned(
                                  bottom: 30,
                                  left: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("Ayasofya Müzesi"),
                                      )),
                                ),
                                Positioned(
                                  bottom:0,
                                  left: 10,
                                  child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey,
                                      ),
                                      child: const Padding(
                                        padding: EdgeInsets.all(5.0),
                                        child: Text("*4.1"),
                                      )),
                                ),
                                Positioned(
                                  bottom:30,
                                  right: 10,
                                  child: CircleAvatar(
                                    backgroundColor: Colors.white,
                                      child: IconButton(onPressed:(){},
                                          icon: Icon(Icons.health_and_safety_rounded,color: Colors.red,)
                                      ),
                                ),)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
