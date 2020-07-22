import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// connstans
import './constants.dart';

// theme
import './theme.dart';

// Screen
import 'screen/Home.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      systemNavigationBarColor: ligthBackgroundColor,
      statusBarColor: ligthBackgroundColor,
      statusBarIconBrightness: Brightness.dark, // status bar icons' color
      systemNavigationBarIconBrightness: Brightness.dark,
    ));
    return MaterialApp(
      title: 'Personal Expenses',
      theme: mainTheme,
      home: Home(),
      debugShowCheckedModeBanner: false,
    );
  }
}
