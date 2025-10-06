import 'package:flutter/material.dart';
import 'src/listview_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Práctica 09',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListViewPage(),
    );
  }
}
