import 'package:flutter/material.dart';
import 'src/shared_page.dart';

void main() {
  runApp(const MiAplicacion());
}

class MiAplicacion extends StatelessWidget {
  const MiAplicacion({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica 11',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SharedPage(),
    );
  }
}
