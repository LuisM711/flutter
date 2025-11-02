import 'dart:io';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:practica_19v2/src/pdf_preview.dart';
import 'package:practica_19v2/ui/details_container.dart';
import 'package:practica_19v2/ui/head_container.dart';

class DetailsPage extends StatelessWidget {
  var datosName;
  var datosGender;
  String? datosImage;
  String? _path;

  DetailsPage({
    this.datosName,
    this.datosGender,
    this.datosImage,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(datosName + ' Details'),
        backgroundColor: Color(0xFFFF422C),
        centerTitle: true,
        elevation: 0,
      ),
      body: Container(
        color: Color(0xFF272A3C),
        width: double.infinity,
        height: double.infinity,
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            MyHeadContainer(imagerec: datosImage),
            MyDetailContainer(nom: datosName, sexo: datosGender),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color(0xFFFF422C),
        child: Icon(Icons.print_outlined),
        onPressed: () {
          _downloadImage();
          Future.delayed(
            Duration(milliseconds: 3000),
            () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => PdfPage(
                  nombre: datosName,
                  genero: datosGender,
                  imagenurl: _path,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  _downloadImage() async {
    try {
      final response = await http.get(Uri.parse(datosImage!));
      final directory = await getApplicationDocumentsDirectory();
      final file = File('${directory.path}/temp_image.jpg');
      await file.writeAsBytes(response.bodyBytes);
      _path = file.path;
      print("Imagen descargada");
    } catch (error) {
      print(error);
    }
  }
}

