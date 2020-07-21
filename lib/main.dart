import 'package:flutter/material.dart';

// Screen
import 'src/screen/HomePage.dart';

void main() => runApp(App());

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Personal Expenses',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        accentColor: Colors.amberAccent,
        appBarTheme: AppBarTheme(
          color: Colors.grey[50],
          elevation: 0,
        ),
      ),
      home: HomeScreen(),
    );
  }
}
