import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPage extends StatefulWidget {
  const SharedPage({super.key});

  @override
  State<SharedPage> createState() => _SharedPageState();
}

class _SharedPageState extends State<SharedPage> {
  int _edad = 0;
  String _nombre = '';

  _grabarDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('edad', 12);
    prefs.setString('nombre', 'Luis Mario Roblox');
  }

  _leerDatos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    _edad = prefs.getInt('edad')!;
    _nombre = prefs.getString('nombre')!;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 11'),
        backgroundColor: Colors.yellow,
        foregroundColor: Colors.black,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Nombre: $_nombre',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Edad: $_edad',
              style: const TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _grabarDatos();
          await _leerDatos();
        },
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
