import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import './asset/productsScreen.dart';
import 'asset/prodotto.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ProdottiScreen(),
    );
  }
}

class ProdottiScreen extends StatefulWidget {
  @override
  _ProdottiScreenState createState() => _ProdottiScreenState();
}

class _ProdottiScreenState extends State<ProdottiScreen> {
  List<Prodotto> prodotti = [];
  String statusMessage = "Caricamento in corso...";

Future<void> fetchProducts() async {
    const String url = 'https://capstone-project-server-sy5q.onrender.com/allproduct/643843ab0fd959d820a16e50';
    try {
      final response = await http.get(Uri.parse(url));

if (response.statusCode == 200) {
        final List<dynamic> productJson = json.decode(response.body);
        setState(() {
          prodotti = productJson.map((json) => Prodotto.fromMap(json)).toList();
          statusMessage = "Prodotti caricati";
        });      } else {
        setState(() {
          statusMessage = "Errore nel caricamento: ${response.statusCode}";
        });
      }
    } catch (e) {
      setState(() {
        statusMessage = "Errore: $e";
      });
    }
  }

  @override
  void initState() {
  super.initState();
    fetchProducts();  
    }
  @override
Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Lista Prodotti"),
      ),
      body: prodotti.isEmpty
          ? Center(child: Text(statusMessage))
          : ListView.builder(
              itemCount: prodotti.length,
              itemBuilder: (context, index) {
                final products = prodotti[index];
                return ListTile(
                  title: Text(products.category),
                  subtitle: Text("Prezzo: €${products.price}"),
                );
              },
            ),
    );
  }

  void main() {
  runApp(MaterialApp(
    home: ProdottiScreen(),
  ));
}
  }
