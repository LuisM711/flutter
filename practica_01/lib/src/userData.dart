import 'package:flutter/material.dart';

class DatosUsuarios extends StatefulWidget {
  const DatosUsuarios({Key? key}) : super(key: key);

  @override
  DatosUsuariosState createState() => DatosUsuariosState();
}

class DatosUsuariosState extends State<DatosUsuarios> {
  String _name = '';
  String _phone = '';
  final TextEditingController nameCtrl = TextEditingController();
  final TextEditingController phoneCtrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 01'),
        centerTitle: true,
        backgroundColor: Colors.lightGreen,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Image.asset('lib/assets/images/tough.png'),
            TextField(
              controller: nameCtrl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                hintText: 'Nombre Completo'
              ),
            ),
            TextField(
              controller: phoneCtrl,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.all(5),
                hintText: 'Telefono'
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.lightGreen,
                foregroundColor: Colors.black,
              ),
              child: const Text('Enviar'),
              onPressed: () {
                setState(() {
                  _name = nameCtrl.text;
                  _phone = phoneCtrl.text;
                });
                showAlertDialog(
                  context,
                  'El usuario $_name, tiene un teléfono $_phone',
                  'Mi App:)',
                  'OK',
                  ':(',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

void showAlertDialog(BuildContext context, String message, String title, String buttonText, String icon) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            child: Text(buttonText),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}