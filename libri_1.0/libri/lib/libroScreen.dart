import 'package:flutter/material.dart';
import 'libro.dart';

class LibroScreen extends StatelessWidget {
  final Libro libro;
  const LibroScreen(this.libro, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(libro.titolo),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(libro.immagineCopertina),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Scritto da ${libro.autori}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Editore: ${libro.editore}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(libro.descrizione),
                ),
            ],
        ),)
      ),
      );
  }
}