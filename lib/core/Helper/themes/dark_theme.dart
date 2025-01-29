import 'package:flutter/material.dart';


ThemeData darkTheme ({Color? bkColor, sfBkColor,btmNvBkColor,btmNvUnSItColor,btmNvSItColor,appBrColor,txtColor}){
  return ThemeData(
    brightness: Brightness.light,
    scaffoldBackgroundColor: sfBkColor,
    backgroundColor: bkColor,
    canvasColor: appBrColor,

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: btmNvBkColor,
      unselectedItemColor: btmNvUnSItColor,
      selectedItemColor: btmNvSItColor,
      elevation: 0,
    ),
    buttonTheme: ButtonThemeData(
      textTheme: ButtonTextTheme.primary, //  <-- this auto selects the right color
    ),
    highlightColor: Colors.transparent,
    splashColor: Colors.transparent,
    bottomAppBarTheme: BottomAppBarTheme(
        color: appBrColor
    ),
    appBarTheme: AppBarTheme(
      color: appBrColor,
      elevation: 0,
      textTheme: TextTheme(
        headline6: TextStyle(
          color: txtColor,
          fontSize: 20,
        ),
      ),
    ),
    textTheme: TextTheme(
      headline4:TextStyle(
        color: txtColor,
        fontSize: 20,
      ) ,
      // bodyText1: TextStyle(
      //   color: txtColor,
      //   fontSize: 20,
      // ),
      // headline1: TextStyle(
      //   color: txtColor,
      //   fontSize: 20,
      // ),
      // button: TextStyle(
      //   color: txtColor,
      //   fontSize: 20,
      // ),
      bodyText1:TextStyle(
      color: txtColor,
      fontSize: 20,
    )),
  );}
