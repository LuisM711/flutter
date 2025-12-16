import 'package:flutter/material.dart';
import 'package:practica_00_holamundo/src/pages/increment_pages.dart';

class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Center(
        child: IncrementPage()
      )
    );
  }
}

