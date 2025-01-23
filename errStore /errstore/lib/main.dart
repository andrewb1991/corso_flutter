import 'package:flutter/material.dart';
import 'src/products.dart';
import './src/api_service.dart';
import './src/products_screen.dart';
import 'package:page_transition/page_transition.dart';
import './src/addproductpage.dart';
import 'package:http/http.dart' as http;
// import 'package:cached_network_image/cached_network_image.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'errStore',
      theme: ThemeData(
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: ItemsScreen(),
    );
  }
}

class ItemsScreen extends StatelessWidget {
  final ApiService apiService = ApiService();

  ItemsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("errSmart"),
        backgroundColor: const Color.fromARGB(255, 58, 118, 166),
        actions: [
          IconButton(
              icon: Icon(Icons.smartphone),
              tooltip: 'Smartphone',
              onPressed: () {
                Future<void> _submitProduct() async {
                  final url = Uri.parse(
                      'https://capstone-project-server-sy5q.onrender.com/smartphone/');
                  final response = await http.get(
                    url,
                  );

                  if (response.statusCode == 200 ||
                      response.statusCode == 201) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content: Text('Prodotto aggiunto con successo!')),
                    );
                    Navigator.pop(context); // Torna indietro dopo l'inserimento
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                          content:
                              Text('Errore durante l\'aggiunta del prodotto')),
                    );
                  }
                }
              }),
          IconButton(
              icon: Icon(Icons.add, color: Colors.blue),
              onPressed: () {
                Navigator.push(
                    context,
                    PageTransition(
                      type: PageTransitionType.rightToLeftWithFade,
                      childCurrent: this,
                      child: AddProductPage(),
                    )
                    // Navigator.push(
                    //   context,
                    //   MaterialPageRoute(builder: (context) => AddProductPage()),
                    // );
                    );
              }),
          // Pulsante per Smartphone
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 156, 190, 218),
      body: FutureBuilder<List<Product>>(
        future: apiService.fetchItems(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Errore: ${snapshot.error}"));
          } else if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text("Nessun dato disponibile"));
          } else {
            final items = snapshot.data!;
            return ListView.builder(
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return ListTile(
                  onTap: () {
                    Navigator.push(
                        context,
                        PageTransition(
                          type: PageTransitionType.rightToLeftJoined,
                          childCurrent: this,
                          child: ProdottoScreen(items[index]),
                        )

                        // MaterialPageRoute route = MaterialPageRoute(
                        //     builder: (_) => ProdottoScreen(items[index]));
                        // Navigator.push(context, route);
                        );
                  },
                  leading: Image.network(
                    item.thumbnail, // Link all'immagine
                    width: 50, // Larghezza dell'immagine
                    height: 50, // Altezza dell'immagine
                    fit: BoxFit
                        .scaleDown, // Adatta l'immagine all'area disponibile
                    errorBuilder: (context, error, stackTrace) {
                      return Icon(Icons.broken_image,
                          size: 50); // Icona di fallback
                    },
                  ),
                  title: Text(item.product),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Categoria: ${item.category}"), // Primo subtitle
                      Text("Prezzo: ${item.price} €"),
                      // Text("Descrizione: ${item.description}"), // Secondo subtitle
                    ],
                  ),
                );
              },
            );
          }
        },
      ),
    );
  }
}
