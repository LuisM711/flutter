import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mi primer APP en Flutter'),
      ),
      body: Center(
        child: Text('Hola Mundo'),
      ),
    );
  }
}

