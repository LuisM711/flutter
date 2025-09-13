import 'package:flutter/material.dart';
import 'package:practica_01/src/userData.dart';

class Myapp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 1',
      home: Center(
        child: DatosUsuarios(),
      ),
    );
  }
}