import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import '../data/movies.dart';

class ListViewPage extends StatefulWidget {
  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 17 - Dismissed'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index) {
          final item = pelis[index];
          return Slidable(
            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['Genres']),
            ),
            startActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Agregar',
                  backgroundColor: Colors.green,
                  icon: Icons.library_add,
                  onPressed: (context) => onDismissed(index, 'Agregar'),
                ),
              ],
            ),
            endActionPane: ActionPane(
              motion: DrawerMotion(),
              children: [
                SlidableAction(
                  label: 'Eliminar',
                  backgroundColor: Colors.red,
                  icon: Icons.cancel_outlined,
                  onPressed: (context) => onDismissed(index, 'Eliminar'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  void onDismissed(int index, String accion) {
    setState(() {
      final _snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);

      switch (accion) {
        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
      }
    });
  }
}
