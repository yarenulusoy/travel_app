import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/register/register_view.dart';
import '../../core/base/base_state.dart';
import '../../core/widget/textfield/textfield_widget.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/button/login_button.dart';
import '../home_view.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../../data/firebase/firebase_auth.dart';
part 'login_string_values.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> with BaseState {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final FirebaseAuthentication _authentication = FirebaseAuthentication();

  Future<void> onLogin() async {
    if (emailController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      try {
        await _authentication
            .signIn(
            email: emailController.text, password: passwordController.text)
            .then((value) {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeView()));
        });
      } on FirebaseAuthException catch (e) {
        setState(() {
          ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
            content: Text("Kullanıcı Adı ve Şifrenizi doğru giriniz."),
          ));
        });
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Bütün alanları doldurun."),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(1),
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imageConstant.LOGIN_BACKGROUND_IMAGE),
              fit: BoxFit.fill)),
      child: Scaffold(
          backgroundColor: Colors.transparent,
          body: Column(
            children: [
              Expanded(
                  flex: 2,
                  child: Container(
                    alignment: Alignment.bottomLeft,
                    color: Colors.transparent,
                    child: AutoSizeTextWidget(
                      title: "",
                      style: textThemeLight.headline5
                          .copyWith(color: Colors.white),
                    ),
                  )),
              Expanded(
                flex: 5,
                child: Container(
                  alignment: Alignment.centerLeft,
                  width: context.dynamicWidth(widthConstant.widthPoint7),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        buildPadding(
                            context,
                            _LoginStringValues().USER_NAME_TEXT,
                            emailController,false),
                        buildPadding(
                            context,
                            _LoginStringValues().PASSWORD_TEXT,
                            passwordController,true),
                        Container(
                          padding: paddingConstants.paddingVertical5,
                          width:
                              context.dynamicWidth(widthConstant.widthPoint4),
                          child: LoginButton(
                            text: _LoginStringValues().LOGIN,
                            bgColor: Colors.indigo,
                            textColor: Colors.white,
                            onPressed: () async {
                              onLogin();
                            },
                          ),
                        ),
                        Container(
                          padding: paddingConstants.paddingVertical5,
                          width:
                              context.dynamicWidth(widthConstant.widthPoint4),
                          child: LoginButton(
                            text: _LoginStringValues().REGISTER,
                            bgColor: Colors.indigo,
                            textColor: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => RegisterView()));
                            },
                          ),
                        ),
                        /*Padding(
                          padding: paddingConstants.paddingVertical10,
                          child: TextButton(
                            onPressed: () {},
                            child: AutoSizeTextWidget(
                              title: _LoginStringValues().IFORGET_MY_PASSWORD,
                              style: textThemeLight.subtitle1.copyWith(
                                  color: colorThemeLight.black,
                                  decoration: TextDecoration.underline),
                            ),
                          ),
                        ),*/
                      ],
                    ),
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Padding buildPadding(
      BuildContext context, String hintText, TextEditingController controller,bool tf) {
    return Padding(
      padding: context.paddingVerticalNormal,
      child: TextFieldWidget(
        obscureText: tf,
        controller: controller,
        hintText: hintText,
      ),
    );
  }
}
