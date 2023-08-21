import 'package:flutter/material.dart';

class DarkTheme {
  ThemeData get theme => ThemeData(
        textTheme: TextTheme(
          headline1: TextStyle(
              color: Colors.black, fontSize: 20.0, fontWeight: FontWeight.bold),
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.grey, fontSize: 15.0),
        ),
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Color(0xFF222222),
        dialogBackgroundColor: Colors.black,
        primaryColor: Colors.black,
        accentColor: Colors.white,
        backgroundColor: Colors.grey,
        primaryColorLight: Colors.white,
      );
}
