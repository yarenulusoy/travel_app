import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/core/widget/sizedbox/sizedbox_widget.dart';
import 'package:travel_app/view/login/login_view.dart';
import 'package:travel_app/view/profile/profile_detail.dart';
import 'package:travel_app/view/profile/profile_posts.dart';
import '../../core/base/base_state.dart';
import '../../data/firebase/firebase_auth.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/button/login_button.dart';
import '../favorite/favorite_posts.dart';



class ProfileSettingsView extends StatefulWidget {
  const ProfileSettingsView({Key? key}) : super(key: key);

  @override
  State<ProfileSettingsView> createState() => _ProfileSettingsViewState();
}

class _ProfileSettingsViewState extends State<ProfileSettingsView> with BaseState {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final FirebaseFunctions _functions = FirebaseFunctions();
  late String name;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top:50),
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
                    flex: 1,
                    child: FutureBuilder(
                        future: _functions.getUserDetail(),
                        builder: (context, snapshot) {
                          if (snapshot.hasError) {
                            return  AutoSizeTextWidget(
                              title: "",
                              style: textThemeLight.headline6,
                            );
                          }

                          if (snapshot.hasData) {
                            name=snapshot.data![0].name.toString();
                            return  AutoSizeTextWidget(
                              title: name,
                              style: textThemeLight.headline6,
                            );
                          } else {
                            return SizedBox();
                          }
                        }),

                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    width: context.dynamicWidth(0.7),
                    child:Container(
                      height: context.dynamicHeight(0.05),
                      decoration: BoxDecoration(
                        borderRadius: borderConstant.borderRadiusCircular20,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          LoginButton(text: "Profil Bilgilerim", textColor: Colors.grey, onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfileDetail()));

                          }),
                          SizedBoxWidget(),
                          LoginButton(text: "Favorilerim", textColor: Colors.grey, onPressed:() {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FavoritePost()));

                          }),
                          SizedBoxWidget(),
                          LoginButton(text: "Gezdiğim Yerler", textColor: Colors.grey, onPressed:(){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => ProfilePost()));


                          }),
                          SizedBoxWidget(),
                          LoginButton(text: "Oturumu Kapat", textColor: Colors.grey, onPressed:(){
                            _authentication.logOut();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => LoginView()));

                          })


                        ],
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
