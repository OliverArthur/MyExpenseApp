import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// Screen
import 'src/screen/HomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amberAccent,
        appBarTheme: AppBarTheme(
          color: Colors.grey[100],
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
