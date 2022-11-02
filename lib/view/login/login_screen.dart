import 'package:flutter/material.dart';
import 'package:travel_app/view/home/home_view.dart';
import 'package:travel_app/view/login/register_screen.dart';
import '../../widgets/button/login_button.dart';
import '../../widgets/text_field/login_text.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/images/png/login.png'), fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(),
            Container(
              padding: const EdgeInsets.only(left: 35, top: 130),
              child: const Text(
                'LOGO',
                style: TextStyle(color: Colors.white, fontSize: 33),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          const LoginText(text: "Kullanıcı Adı veya Eposta"),
                          const SizedBox(
                            height: 40,
                          ),
                          const LoginText(text: "Şifre"),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    height: height / 15,
                                    width: width * 80 / 100,
                                    child: LoginButton(
                                      text: "GİRİŞ YAP",
                                      bgColor: Colors.indigo,
                                      textColor: Colors.white,
                                      onPressed: () {
                                        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeView()));
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 15.0),
                                    child: SizedBox(
                                      height: height / 15,
                                      width: width * 80 / 100,
                                      child: LoginButton(
                                        text: "KAYIT OL",
                                        bgColor: Colors.white,
                                        textColor: Colors.indigo,
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => const RegisterScreen()));
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'ŞİFREMİ UNUTTUM',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
