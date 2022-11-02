import 'package:flutter/material.dart';

class ProfileSettingsScreen extends StatefulWidget {
  const ProfileSettingsScreen({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsScreen> createState() => _ProfileSettingsScreenState();
}

class _ProfileSettingsScreenState extends State<ProfileSettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(            flex: 2,
            child: Container(
              width: 200,
              color: Colors.yellow,
              child:
              CircleAvatar(
                backgroundImage:
                AssetImage("assets/images/logo.png"),
              ),
            ),
          ),
          profileSettingsWidget("Profil Bilgilerim"),
          profileSettingsWidget("Gezdiğim Yerler"),
          profileSettingsWidget("Favorilerim"),
          profileSettingsWidget("Listelerim"),
          profileSettingsWidget("Oturumu Kapat"),

        ],
      ),
    );
  }

  Expanded profileSettingsWidget(String txt) {
    return Expanded(flex: 1, child: Padding(
      padding: const EdgeInsets.all(20.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Icon(Icons.person_add)),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(child: Text("${txt}",
                style: TextStyle(fontSize: 10, color: Colors.black),)),
            ),
          ],
        ),
      ),
    ));
  }
}
