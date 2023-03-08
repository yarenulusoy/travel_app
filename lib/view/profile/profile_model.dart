
import 'package:flutter/material.dart';


class ProfileModel extends StatelessWidget {
  final VoidCallback onTap;
  String title;
  IconData icon;

  ProfileModel({super.key, required this.onTap,required this.title,required this.icon});


  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
    );
  }
}


