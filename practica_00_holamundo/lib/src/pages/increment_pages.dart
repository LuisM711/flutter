import 'package:flutter/material.dart';

class IncrementPage extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _IncrementPageState();
  }
}

class _IncrementPageState extends State<IncrementPage>{
  int _conteo = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Mi Primer App en Flutter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget> [
            Text('Número de Click', style: TextStyle(fontSize: 25)),
            Text('$_conteo', style: TextStyle(fontSize: 30, color: Colors.red))
          ],
        ),
      ),
      floatingActionButton: Stack(
        children: <Widget>[
          Positioned(
            bottom: 0,
            right: 0,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _conteo++;
                });
              },
              child: Icon(Icons.add),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 70,
            child: FloatingActionButton(
              onPressed: () {
                setState(() {
                  _conteo--;
                });
              },
              child: Icon(Icons.remove),
            ),
          ),
        ],
      ),
    );
  }
}

