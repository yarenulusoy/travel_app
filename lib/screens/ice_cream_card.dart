import 'package:flutter/material.dart';

class IceCreamCard extends StatelessWidget {
  const IceCreamCard({
    this.flavorColor = Colors.redAccent,
    this.flavor = 'Flavor Name',
  });
  final Color flavorColor;
  final String flavor;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: Color(0xffeeeeee), width: 2.0),
        color: Colors.white38,
        borderRadius: BorderRadius.all(Radius.circular(8.0)),
        boxShadow: [
          BoxShadow(
            color: Colors.white10,
            blurRadius: 4,
            spreadRadius: 2,
            offset: Offset(0, 2),
          ),
        ],
      ),
      margin: EdgeInsets.all(8),
      height: 200,
      width: 200,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: Icon(
                Icons.icecream,
                size: 100.0,
                color: flavorColor,
              )),
          SizedBox(
            height: 20.0,
          ),
          Text(
            flavor,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24.0,
                color: flavorColor),
          ),
        ],
      ),
    );
  }
}