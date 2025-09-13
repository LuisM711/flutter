import 'package:flutter/material.dart';
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Página 2'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: (){
              Navigator.of(context).pop();
            },
            child: const Text("Atras"),
          ),
        ],
      )),
    );
  }
}