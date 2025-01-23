import 'package:flutter/material.dart';
import './prodotto.dart';

class ProductsScreen extends StatelessWidget {
  final Prodotto prodotto;
  const ProductsScreen(this.prodotto, {super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prodotto.product),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Image.network(prodotto.thumbnail),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Categoria ${prodotto.category}',
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text('Prezzo: ${prodotto.price}',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Text(prodotto.description),
                ),
            ],
        ),)
      ),
      );
  }
}