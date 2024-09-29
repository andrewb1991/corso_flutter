import 'dart:async';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:sembast/sembast.dart';
import 'package:sembast/sembast_io.dart';
import 'articolo.dart';

class ArticoloDb {
  DatabaseFactory dbFactory = databaseFactoryIo;
  Database? _db;
  final store = intMapStoreFactory.store('articoli');
  Future _openDb() async {
    final percorsoDocumenti = await getApplicationDocumentsDirectory();
    final percorsoDb = join(percorsoDocumenti.path, 'articolo.db');
    final db = await dbFactory.openDatabase(percorsoDb);
    return db;
  }

  Future inserisciArticolo(Articolo articolo) async {
    Database db = await _openDb();
    int id = await store.add(db, articolo.trasformaInMap());
    return id;
  }

  Future<List<Articolo>> leggiArticoli() async {
    Database db = await _openDb();
    final finder = Finder(sortOrders: [
      SortOrder('id'),
    ]);
    final articoliSnapshot = await store.find(db, finder: finder);
    return articoliSnapshot.map((elemento) {
      final articolo = Articolo.daMap(elemento.value);
      articolo.id = elemento.key;
      return articolo;
    }).toList();
  }

  Future aggiornaArticolo(Articolo articolo) async {
    Database db = await _openDb();
    final finder = Finder(filter: Filter.byKey(articolo.id));
    await store.update(db, articolo.trasformaInMap(), finder: finder);
  }

  Future eliminaArticolo(Articolo articolo) async {
    Database db = await _openDb();
    final finder = Finder(filter: Filter.byKey(articolo.id));
    await store.delete(db, finder: finder);
  }

  Future eliminaDatiDb() async {
    Database db = await _openDb();
    await store.delete(db);
  }
}
