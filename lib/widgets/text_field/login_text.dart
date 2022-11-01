import 'package:flutter/material.dart';

class LoginText extends StatelessWidget {
  final String text;

  const LoginText(
      {Key? key,
        required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.black),
      decoration: InputDecoration(
          fillColor: Colors.grey.shade100,
          filled: true,
          hintText: text,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          )),
    );
  }
}


