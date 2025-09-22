import 'package:flutter/material.dart';

class Data {
  final String nombre;
  final String sexo;

  Data({required this.nombre, required this.sexo});
}

class DatosPage extends StatefulWidget {
  final datos;
  const DatosPage({Key? key, required this.datos}) : super(key: key);

  @override
  _DatosPageState createState() => _DatosPageState();
}

class _DatosPageState extends State<DatosPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos Recibidos'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Los datos son:'),
            Text('Nombre: ${widget.datos.nombre}'),
            Text('Sexo: ${widget.datos.sexo}'),
          ],
        ),
      ),
    );
  }
}