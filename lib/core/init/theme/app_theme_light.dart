import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:travel_app/core/init/theme/app_theme.dart';

import '../../base/base_state.dart';
import '../../constant/app/app_constant.dart';

class AppThemeLight extends AppTheme with BaseState {
  static AppThemeLight? _instance;
  static AppThemeLight get instance {
    _instance ??= AppThemeLight._init(); // if(_instance==null) _instance=AppThemeLight._init();
    return _instance!;
  }

  AppThemeLight._init();

  @override
  ThemeData get theme => ThemeData(
        listTileTheme: listTileTheme(),
        drawerTheme: drawerTheme(),
        iconTheme: iconTheme(),
        colorScheme: _appColorScheme(),
        textTheme: textTheme(),
        fontFamily: ApplicationConstant.FONT_FAMILY,
        tabBarTheme: tabBarTheme(),
        cardTheme: cardTheme(),
        appBarTheme: appBarTheme(),
        textButtonTheme: textButtonThemeData(),
        bottomAppBarTheme: bottomAppBarTheme(),
        inputDecorationTheme: inputDecorationTheme(),
        elevatedButtonTheme: elevatedButtonThemeData(),
      );

  ColorScheme _appColorScheme() {
    return ColorScheme(
        brightness: Brightness.light,
        primary: colorThemeLight.melrose,
        onPrimary: colorThemeLight.vodka,
        secondary: colorThemeLight.periwinkle,
        onSecondary: Colors.pink,
        error: Colors.red,
        onError: Colors.red,
        background: Colors.transparent,
        onBackground: Colors.black,
        surface: Colors.black,
        onSurface: Colors.black);
  }

  TextTheme textTheme() {
    return TextTheme(
        headline1: textThemeLight.headline1,
        headline2: textThemeLight.headline2,
        headline3: textThemeLight.headline3,
        headline4: textThemeLight.headline4,
        headline5: textThemeLight.headline5,
        headline6: textThemeLight.headline6,
        subtitle1: textThemeLight.subtitle1,
        subtitle2: textThemeLight.subtitle2,
        overline: textThemeLight.overlineText,
        bodyText1: textThemeLight.bodyText1,
        bodyText2: textThemeLight.bodyText2,
        button: textThemeLight.buttonText,
        caption: textThemeLight.captionText);
  }

  DrawerThemeData drawerTheme() {
    return DrawerThemeData(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topRight: borderConstant.radiusCircular30,
              bottomRight: borderConstant.radiusCircular30)),
      backgroundColor: Colors.white.withOpacity(0.85),
      elevation: 5,
    );
  }

  ListTileThemeData listTileTheme() {
    return const ListTileThemeData(
      iconColor: Colors.white,
      textColor: Colors.white,
    );
  }

  CardTheme cardTheme() {
    return CardTheme(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      margin: EdgeInsets.zero,
      elevation: 3,
      clipBehavior: Clip.antiAliasWithSaveLayer,
    );
  }

  AppBarTheme appBarTheme() {
    return AppBarTheme(
      backgroundColor: Colors.white,
      elevation:2,
      foregroundColor: Colors.black,
      // systemOverlayStyle: const SystemUiOverlayStyle(
      //   statusBarIconBrightness: Brightness.dark, // For Android (dark icons)
      //   statusBarBrightness: Brightness.light,
      // )
    );
  }

  TextButtonThemeData textButtonThemeData() {
    return TextButtonThemeData(
        style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red)));
  }

  TabBarTheme tabBarTheme() {
    return TabBarTheme(unselectedLabelColor: Colors.grey[800], labelColor: Colors.red);
  }

  BottomAppBarTheme bottomAppBarTheme() {
    return BottomAppBarTheme(color: Colors.white, elevation: 0);
  }

  IconThemeData iconTheme() {
    return IconThemeData(color: Colors.grey[800]);
  }

  ElevatedButtonThemeData elevatedButtonThemeData() {
    return ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: colorThemeLight.pictonBlue.withOpacity(1),
      ),
    );
  }

  InputDecorationTheme inputDecorationTheme() {
    return InputDecorationTheme(
      hintStyle: textThemeLight.subtitle1.copyWith(color: Colors.black),
      labelStyle: textThemeLight.subtitle1.copyWith(color: Colors.black),
      filled: true,
      focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(5.0)),
          borderSide: BorderSide(color: Colors.blue)),
      border: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.black),
        borderRadius: BorderRadius.circular(15),
      ),
      fillColor: Colors.grey.shade100,
    );
  }
}
