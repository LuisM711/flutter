import 'package:flutter/material.dart';
import 'package:practica_04/src/datos_recibidos.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  final ctrlnom = TextEditingController();
  final data = Data(nombre: '', sexo: '');
  int _valor = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange[200],
        title: const Text('Practica 04'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlnom,
              keyboardType: TextInputType.name,
              decoration: const InputDecoration(
                hintText: 'Ingresa el nombre',
                contentPadding: EdgeInsets.all(20)
              ),
            ),
            const SizedBox(height: 20),
            DropdownButton(
              value: _valor,
              items: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Mujer'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Hombre'),
                )
              ],
              onChanged: (selected){
                setState((){
                  _valor = selected!;
                });
              },
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange[200],
                foregroundColor: Colors.white,
              ),
              onPressed: () {
                setState(() {
                  data.nombre = ctrlnom.text;
                  if (_valor ==1){
                    data.sexo = 'Mujer';
                  } else {
                    data.sexo = 'Hombre';
                  }
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DatosPage(datos: data),
                  ));
                });
              },
              child: const Text('Enviar'),
            ),
          ],
        ),
      ),
    );
  }
}
class Data {
  String nombre;
  String sexo;

  Data({required this.nombre, required this.sexo});
}