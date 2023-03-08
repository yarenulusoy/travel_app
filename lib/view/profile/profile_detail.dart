import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import '../../core/base/base_state.dart';
import '../../data/firebase/firebase_auth.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/button/login_button.dart';
import '../post/add_post_view.dart';

class ProfileDetail extends StatefulWidget {
  const ProfileDetail({Key? key}) : super(key: key);

  @override
  State<ProfileDetail> createState() => _ProfileDetailState();
}

class _ProfileDetailState extends State<ProfileDetail> with BaseState {
  final FirebaseFunctions _functions = FirebaseFunctions();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  List favoriteList = [];

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController mailController = TextEditingController();
    TextEditingController telController = TextEditingController();

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50),
        child: Center(
          child: Container(
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SizedBox(
                    width: 200,
                    child: CircleAvatar(
                      backgroundImage: AssetImage(imageConstant.USER_JPG),
                    ),
                  ),
                ),
                Expanded(
                  flex: 7,
                  child: Container(
                    width: context.dynamicWidth(0.7),
                    child: Padding(
                      padding: paddingConstants.paddingAll10,
                      child: Container(
                        height: context.dynamicHeight(0.05),
                        decoration: BoxDecoration(
                          borderRadius: borderConstant.borderRadiusCircular20,
                        ),
                        child: FutureBuilder(
                            future: _functions.getUserDetail(),
                            builder: (context, snapshot) {
                              if (snapshot.hasError) {
                                return const Text("Hata oluştu");
                              }

                              if (snapshot.hasData) {
                                var user = snapshot.data;
                                nameController.text=user![0].name.toString();
                                mailController.text=user![0].mail.toString();
                                telController.text=user![0].tel.toString();
                                return Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(top: 15, bottom: 10),
                                        child: AlignWidget(
                                            child: AutoSizeText(
                                              "Ad Soyad",
                                              style: textThemeLight.headline6,
                                            )),
                                      ),
                                      TextField(
                                        controller: nameController,

                                        decoration: InputDecoration(border: OutlineInputBorder()),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(top: 15, bottom: 10),
                                        child: AlignWidget(
                                            child: AutoSizeText(
                                              "Mail",
                                              style: textThemeLight.headline6,
                                            )),
                                      ),
                                      TextField(
                                        controller: mailController,
                                        decoration: InputDecoration(border: OutlineInputBorder()),
                                      ),

                                      Padding(
                                        padding: EdgeInsets.only(top: 15, bottom: 10),
                                        child: AlignWidget(
                                            child: AutoSizeText(
                                              "Telefon",
                                              style: textThemeLight.headline6,
                                            )),
                                      ),
                                      TextField(
                                        controller: telController,
                                        decoration: InputDecoration(border: OutlineInputBorder()),
                                      ),
                                      SizedBox(height:30),

                                      LoginButton(text: "Kaydet", textColor: Colors.grey, onPressed:() async {
                                        _functions.updateUserDetail(nameController.text, telController.text);
                                        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                                          content: Text("Kaydedildi."),
                                        ));
                                                }),
                                    ],
                                  ),
                                );
                              } else {
                                return SizedBox();
                              }
                            }),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
