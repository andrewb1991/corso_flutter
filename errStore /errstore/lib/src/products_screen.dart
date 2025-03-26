import 'package:flutter/material.dart';
import './products.dart';

class ProdottoScreen extends StatelessWidget {
  final Product prodotti;
  ProdottoScreen(this.prodotti);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('${prodotti.product}'),
          backgroundColor: const Color.fromARGB(255, 58, 118, 166)),
      backgroundColor: const Color.fromARGB(255, 156, 190, 218),
      body: SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.all(8),
              child: ClipRRect(
    borderRadius: BorderRadius.circular(16.0), 
    child: Image.network(
      prodotti.thumbnail,
      width: 200,
      height: 200,
      fit: BoxFit.contain,
    ),
  ),),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Prezzo: ${prodotti.price}€',
                style: TextStyle(
                    fontSize: 20, color: const Color.fromARGB(255, 27, 95, 150)
                    ),
              ),
              
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Text(
                'Categoria: ${prodotti.category}',
                style: TextStyle(
                    fontSize: 20, color: const Color.fromARGB(255, 27, 95, 150)
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
