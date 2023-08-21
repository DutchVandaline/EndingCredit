import 'package:flutter/material.dart';

class LightTheme {
  ThemeData get theme => ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.white, fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.black),
          bodyText2: TextStyle(color: Colors.grey, fontSize: 15.0),
        ),
        brightness: Brightness.light,
        scaffoldBackgroundColor: Color(0xFFF2F2F7),
        dialogBackgroundColor: Color(0xFFF2F2F7),
        primaryColor: Colors.white,
        accentColor: Colors.black,
        backgroundColor: Colors.grey,
        primaryColorLight: Color(0xFF333333),
      );
}
