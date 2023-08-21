import 'package:endingcredit/DataBase/MovieNotifier.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:endingcredit/Themes/LightTheme.dart';
import 'package:endingcredit/Themes/DarkTheme.dart';
import 'Screens/HomeScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: MovieNotifier()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: LightTheme().theme,
        darkTheme: DarkTheme().theme,
        home: HomeScreen(),
      ),
    );
  }
}
