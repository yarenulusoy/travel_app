import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Color bgColor;
  final double bgColorOpacity;
  final Color textColor;
  final double height;
  final VoidCallback onPressed;

  const LoginButton(
      {Key? key,
        required this.text,
        this.bgColor = Colors.white,
        this.bgColorOpacity = 0.2,
        required this.textColor,
        this.height = 50,
        required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
        height: height,
        child:ElevatedButton(
          onPressed: onPressed,
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
            ),),
          child: Text(
            text,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        )
    );
  }
}


