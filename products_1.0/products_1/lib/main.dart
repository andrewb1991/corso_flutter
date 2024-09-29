import 'package:flutter/material.dart';
import 'package:products_1/dati/articolo.dart';
import 'package:products_1/pagine/lista_articoli.dart';
import './dati/articolo_db.dart';
import './dati/articolo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'SpesApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const ListaArticoli(),
    );
  }
}

class ProvaDb extends StatefulWidget {
  const ProvaDb({super.key});

  @override
  State<ProvaDb> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<ProvaDb> {
  int id = 0;

  @override
  void initState() {
    provaDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: const Text('SpesApp')),
    body: Center(child: Container(
    child: Text(id.toString())
    ),)
    );
  }

  Future provaDb() async {
    ArticoloDb articoloDb = ArticoloDb();
    Articolo articolo = Articolo('Arance', '2kg', 'da spremuta');
    id = await articoloDb.inserisciArticolo(articolo);
    setState(() {
      id = id;
    });
  }
}
