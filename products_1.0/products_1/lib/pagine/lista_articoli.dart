import 'package:flutter/material.dart';
import 'package:products_1/pagine/articolo.dart';
import '../dati/articolo.dart';
import '../dati/articolo_db.dart';

class ListaArticoli extends StatefulWidget {
  const ListaArticoli({super.key});

  @override
  State<ListaArticoli> createState() => _ListaArticoliState();
}

class _ListaArticoliState extends State<ListaArticoli> {
  ArticoloDb? db;
  @override
  void initState() {
    db = ArticoloDb();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Lista della Spesa'), actions: [
        IconButton(icon: const Icon(Icons.delete_sweep),
        onPressed: CancellaTutto,
        )
        ],),
        floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.add),
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        PaginaArticolo(Articolo('', '', ''), true)));
          },
        ),
        body: FutureBuilder(
            future: leggiArticoli(),
            builder: (context, snapshot) {
              List<Articolo> lista = snapshot.data ?? [];
              return ListView.builder(
                itemBuilder: (_, index) {
                  var dismissible = Dismissible(
                    key: Key(lista[index].toString()),
                    onDismissed: (_) {
                      db?.eliminaArticolo(lista[index]);
                    },
                    child: ListTile(
                      title: Text(lista[index].nome),
                      subtitle: Text(
                          'Quantità ${lista[index].quantita}- Note ${lista[index].note ?? 'Nessuna informazione da mostrare'}'),
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PaginaArticolo(lista[index], false)));
                      },
                    ),
                  );
                  return dismissible;
                },
                itemCount: lista.length,
              );
            }));
  }

  Future leggiArticoli() async {
    List<Articolo>? articoli = await db!.leggiArticoli();
    return articoli;
  }

  // ignore: non_constant_identifier_names
  void CancellaTutto() {
    AlertDialog alert = AlertDialog(
        title: const Text('Eliminare tutti gli elementi della lista?'),
        content: const Text('Questa operazione è irreversibile'),
        actions: [
          TextButton(
            child: const Text('SI'),
            onPressed: () {
              db?.eliminaDatiDb().then((value) {
                setState(() {
                  db = ArticoloDb();
                });
                // ignore: use_build_context_synchronously
                Navigator.pop(context);
              });
            },
          ),
          TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('NO'))
        ]);
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
}
