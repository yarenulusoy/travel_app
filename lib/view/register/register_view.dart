import 'package:flutter/material.dart';
import 'package:travel_app/core/extension/context_extension.dart';
import 'package:travel_app/view/login/login_view.dart';
import '../../core/base/base_state.dart';
import '../../core/constant/app/app_constant.dart';
import '../../core/widget/button/elevated_button_widget.dart';
import '../../core/widget/sizedbox/sizedbox_widget.dart';
import '../../core/widget/textfield/textfield_widget.dart';
import '../../data/firebase/firebase_auth.dart';
import '../../data/firebase/firebase_functions.dart';
import '../../widgets/auto_size_text/auto_size_text_widget.dart';
import '../../widgets/constant/icons/icon_path.dart';


part 'register_string_values.dart';
class RegisterView extends StatefulWidget {
  const RegisterView({Key? key}) : super(key: key);

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> with BaseState {
  final FirebaseAuthentication _authentication = FirebaseAuthentication();
  final FirebaseFunctions _functions = FirebaseFunctions();
  final TextEditingController emailController=TextEditingController();
  final TextEditingController usernameController=TextEditingController();
  final TextEditingController passwordController1=TextEditingController();
  final TextEditingController passwordController2=TextEditingController();


  Future<void> createAccount() async {
    if (usernameController.text.isNotEmpty &&
        emailController.text.isNotEmpty &&
        passwordController1.text.isNotEmpty&&passwordController2.text.isNotEmpty) {

      await _authentication
      .signUp(email: emailController.text, password: passwordController1.text)
          .then((value) {
        _functions.createUser(emailController.text);
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => LoginView()));
      });
    } else {
      print("All fields are required");
    }
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: context.paddingNormal,
      width: context.dynamicWidth(1),
      height: context.dynamicHeight(2),
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              //opacity: 0.8,
              image: AssetImage(imageConstant.REGISTER_BACKGROUND_IMAGE),
              fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: Column(
            children: [
              Expanded(
                  flex: 1,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          padding: paddingConstants.paddingAll10,
                          alignment: Alignment.topLeft,
                          child: IconButton(icon:Icon(IconsConstant.CHEVRON_RIGHT_ICON), onPressed: () {   Navigator.push(
                              context, MaterialPageRoute(builder: (context) => LoginView()));
                          },)),
                      Container(
                          alignment: Alignment.bottomCenter,
                          child: AutoSizeTextWidget(
                              title: ApplicationConstant.APP_NAME ,
                              style: textThemeLight.headline4)),
                      const SizedBoxWidget()
                    ],
                  )),
              Expanded(
                  flex: 4,
                  child: Container(
                    width: context.dynamicWidth(widthConstant.widthPoint9),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          textFieldPadding(context, _RegisterStringValues().MAIL,emailController),
                          textFieldPadding(context, _RegisterStringValues().USER_NAME_TEXT,usernameController),
                          textFieldPadding(context, _RegisterStringValues().PASSWORD_TEXT,passwordController1),
                          textFieldPadding(context, _RegisterStringValues().VERIFY_PASSWORD_TEXT,passwordController2),
                          Container(
                            padding: context.paddingVerticalNormal,
                            width:
                                context.dynamicWidth(widthConstant.widthPoint5),
                            child: ElevatedButtonWidget(
                              onPressed: () {
                                createAccount();
                              },
                              child: AutoSizeTextWidget(
                                  title: _RegisterStringValues().REGISTER,
                                  style: textThemeLight.subtitle1,
                                  maxLines: 1),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              AutoSizeTextWidget(
                                  title: _RegisterStringValues().YOU_HAVE_ACCOUNT,
                                  style: textThemeLight.subtitle1),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context, MaterialPageRoute(builder: (context) => LoginView()));
                                  },
                                  child: AutoSizeTextWidget(
                                      title: _RegisterStringValues().LOGIN,
                                      style: textThemeLight.subtitle2
                                          .copyWith(fontSize: 18)))
                            ],
                          )
                        ],
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Padding textFieldPadding(BuildContext context, String hintText,TextEditingController controller) {
    return Padding(
      padding: context.paddingVerticalLow + context.paddingHorizontalNormal,
      child: TextFieldWidget(hintText: hintText,controller: controller,obscureText: false,),
    );
  }
}
