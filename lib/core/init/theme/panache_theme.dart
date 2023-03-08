  import 'package:flutter/material.dart';
  final ThemeData myTheme = ThemeData(
    primarySwatch: const MaterialColor(4280404467,{50: Color( 0xffe7f9fe )
		, 100: Color( 0xffcff3fc )
		, 200: Color( 0xff9ee7fa )
		, 300: Color( 0xff6edcf7 )
		, 400: Color( 0xff3dd0f5 )
		, 500: Color( 0xff0dc4f2 )
		, 600: Color( 0xff0a9dc2 )
		, 700: Color( 0xff087691 )
		, 800: Color( 0xff054e61 )
		, 900: Color( 0xff032730 )
		}),
    brightness: Brightness.light,
    primaryColor:const  Color( 0xff21c9f3 ),
    primaryColorLight:const Color( 0xffcff3fc ),
    primaryColorDark:const Color( 0xff087691 ),
    canvasColor:const Color( 0xfffafafa ),
    scaffoldBackgroundColor:const Color( 0xfffafafa ),
    bottomAppBarColor: const Color( 0xffffffff ),
    cardColor: const Color( 0xffffffff ),
    dividerColor: const Color( 0x1f000000 ),
    highlightColor: const Color( 0x66bcbcbc ),
    splashColor: const Color( 0x66c8c8c8 ),
    selectedRowColor: const Color( 0xfff5f5f5 ),
    unselectedWidgetColor: const Color( 0x8a000000 ),
    disabledColor: const Color( 0x61000000 ),
    toggleableActiveColor: const Color( 0xff0a9dc2 ),
    secondaryHeaderColor: Color( 0xffe7f9fe ),
    backgroundColor: Color( 0xff9ee7fa ),
    dialogBackgroundColor: Color( 0xffffffff ),
    indicatorColor: Color( 0xff0dc4f2 ),
    hintColor: Color( 0x8a000000 ),
    errorColor: Color( 0xffd32f2f ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.normal,
      minWidth: 88,
      height: 36,
      padding: EdgeInsets.only(top:0,bottom:0,left:16, right:16),
      shape:     RoundedRectangleBorder(
      side: BorderSide(color: Color( 0xff000000 ), width: 0, style: BorderStyle.none, ),
      borderRadius: BorderRadius.all(Radius.circular(2.0)),
      ),
      alignedDropdown: false ,
      buttonColor: Color( 0xffe0e0e0 ),
      disabledColor: Color( 0x61000000 ),
      highlightColor: Color( 0x29000000 ),
      splashColor: Color( 0x1f000000 ),
      focusColor: Color( 0x1f000000 ),
      hoverColor: Color( 0x0a000000 ),
      colorScheme: ColorScheme(
        primary: Color( 0xff21c9f3 ),
        secondary: Color( 0xff0dc4f2 ),
        surface: Color( 0xffffffff ),
        background: Color( 0xff9ee7fa ),
        error: Color( 0xffd32f2f ),
        onPrimary: Color( 0xff000000 ),
        onSecondary: Color( 0xff000000 ),
        onSurface: Color( 0xff000000 ),
        onBackground: Color( 0xff000000 ),
        onError: Color( 0xffffffff ),
        brightness: Brightness.light,
      ),
    ),
    textTheme: TextTheme(
      overline: TextStyle(
      color: Color( 0xff000000 ),
      fontSize: null,
      fontWeight: FontWeight.w400,
      fontStyle: FontStyle.normal,
    ),
    ),
    







    );
