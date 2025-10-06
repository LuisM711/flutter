import 'package:flutter/material.dart';

class ListViewPage extends StatelessWidget {
  const ListViewPage({super.key});

  final List<String> items = const [
    'Normal',
    'Fighting',
    'Flying',
    'Poison',
    'Ground',
    'Rock',
    'Bug',
    'Ghost',
    'Steel',
    'Fire',
    'Water',
    'Grass',
    'Electric',
    'Psychic',
    'Ice',
    'Dragon',
    'Dark',
    'Fairy',
    'Unknown',
    'Shadow',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Practica 10 ListView builder'),
        backgroundColor: Colors.blue,
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading: Image.asset(
              'assets/op.png',
              width: 50,
              height: 50,
              fit: BoxFit.contain,
            ),
            title: Text(items[index]),
            trailing: const Icon(Icons.arrow_forward),
            onTap: () {
              // Acción al tocar el elemento
            },
          );
        },
      ),
    );
  }
}
