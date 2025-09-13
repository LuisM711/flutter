import 'package:chabess/src/pages/page1.dart';
import 'package:chabess/src/pages/page2.dart';
import 'package:chabess/src/pages/page3.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/Page1',
      routes: {
        '/Page1': (context) => Page1(),
        '/Page2': (context) => Page2(),
        '/Page3': (context) => Page3(),
      },
    );
  }
}
