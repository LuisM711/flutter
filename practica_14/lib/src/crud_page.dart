import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CrudPage extends StatefulWidget {
  @override
  _CrudPageState createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late String _path;
  late Database database;
  String _result = 'Presiona un botón para ver los resultados';

  @override
  void initState() {
    _createDB();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 14 - SQLite'),
        centerTitle: true,
      ), 
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _insertDB();
              },
              child: Text('INSERT'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green, foregroundColor: Colors.white),
            ), 
            ElevatedButton(
              onPressed: () {
                _removeDB();
              },
              child: Text('REMOVE'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.red, foregroundColor: Colors.white),
            ), 
            ElevatedButton(
              onPressed: () {
                _updateDB();
              },
              child: Text('UPDATE'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue, foregroundColor: Colors.white),
            ), 
            ElevatedButton(
              onPressed: () {
                _showDB();
              },
              child: Text('SHOW'),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber, foregroundColor: Colors.white),
            ), 
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.all(16),
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[100],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Text(
                _result,
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ), 
      ), 
    ); 
  }

  
  void _createDB() async {
    var dbpath = await getDatabasesPath();

    _path = '$dbpath/my_db.db';

    database = await openDatabase(_path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, nickname TEXT)');
    });
    
    setState(() {
      _result = 'Base de datos creada exitosamente!\n\nPresiona un botón para operaciones CRUD';
    });
  }

  
  void _insertDB() async {
    await database.transaction((txn) async {
      await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES ("Din Djarin", "The Mandalorian")');

      await txn.rawInsert(
          'INSERT INTO Test (name, nickname) VALUES (?,?)',
          ['Grogu', 'The Child']);
    });
    
    setState(() {
      _result = ' INSERT completado!\nSe insertaron 2 registros:\n- Din Djarin (The Mandalorian)\n- Grogu (The Child)';
    });
  }

  
  void _removeDB() async {
    int rem = await database.rawDelete(
        'DELETE FROM Test WHERE name = ?', ['Grogu']);
    
    setState(() {
      _result = 'REMOVE completado!\nSe eliminaron $rem registros\n(registro de Grogu eliminado)';
    });
  }

  
  void _updateDB() async {
    int upt = await database.rawUpdate(
        'UPDATE Test SET nickname =? WHERE name = ?', ['Mando', 'Din Djarin']);
    
    setState(() {
      _result = 'UPDATE completado!\nSe actualizaron $upt registros\nDin Djarin: "The Mandalorian" → "Mando"';
    });
  }

  
  void _showDB() async {
    List<Map> show = await database.rawQuery('SELECT * FROM Test');
    
    setState(() {
      if (show.isEmpty) {
        _result = 'SHOW completado!\nLa base de datos está vacía.\nPresiona INSERT para agregar datos.';
      } else {
        String resultText = '📋 SHOW completado!\nRegistros en la base de datos:\n\n';
        for (var record in show) {
          resultText += 'ID: ${record['id']}\n';
          resultText += 'Nombre: ${record['name']}\n';
          resultText += 'Apodo: ${record['nickname']}\n\n';
        }
        _result = resultText.trim();
      }
    });
  }
}
