import 'package:flutter/material.dart';
import 'Screens/Home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: Home(
        index: 0,
      ),
      routes: <String, WidgetBuilder>{
        '/homepage': (BuildContext context) => new Home(index: 0),
        '/monthView': (BuildContext context) => new Home(index: 1),
        '/quarterView': (BuildContext context) => new Home(index: 2),
        '/yearView': (BuildContext context) => new Home(index: 3),
      },
    );
  }
}
