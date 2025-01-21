import 'package:flutter/material.dart';
import './products.dart';

class ProdottoScreen extends StatelessWidget {
  final Product prodotti;
  ProdottoScreen(this.prodotti);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('Prodotto: ${prodotti.product}'),
          backgroundColor: const Color.fromARGB(255, 58, 118, 166)),
      backgroundColor: const Color.fromARGB(255, 156, 190, 218),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: Image.network(prodotti.thumbnail),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Prezzo: ${prodotti.price} - Categoria: ${prodotti.category} - ',
                style: TextStyle(
                    fontSize: 20, color: const Color.fromARGB(255, 27, 95, 150)
                    // Theme.of(context).colorScheme.onPrimaryFixed
                    ),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Descrizione: ' + prodotti.description,
                style: TextStyle(
                    fontSize: 20, color: const Color.fromARGB(255, 255, 255, 255)),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
