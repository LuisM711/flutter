import 'package:flutter/material.dart';
class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pinkAccent,
      appBar: AppBar(
        backgroundColor: Colors.deepPurpleAccent,
        title: const Text('Practica 2'),
        centerTitle: true,
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/Page1');
            },
            child: const Text("Pagina 1"),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.amber,
              foregroundColor: Colors.white,
            ),
            onPressed: (){
              Navigator.pushNamed(context, '/Page3');
            },
            child: const Text("Pagina 3"),
          )
        ],
      )),
    );
  }
}