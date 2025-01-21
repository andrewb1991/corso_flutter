import 'package:flutter/material.dart';
import './prodotto.dart';

class ProductsScreen extends StatelessWidget {
  final Prodotto prodotto;
  ProductsScreen(this.prodotto);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(prodotto.product),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Image.network(prodotto.thumbnail),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Categoria ' + prodotto.category,
                    style: TextStyle(
                      fontSize: 20,
                      color: Theme.of(context).colorScheme.primary
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text('Prezzo: ' + prodotto.price,
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(prodotto.description),
                ),
            ],
        ),)
      ),
      );
  }
}