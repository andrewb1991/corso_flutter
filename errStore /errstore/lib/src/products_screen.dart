import 'package:errstore/main.dart';
import 'package:flutter/material.dart';
import 'editproductpage.dart';
import 'package:page_transition/page_transition.dart';
import './products.dart';

class ProdottoScreen extends StatefulWidget {
  final Product prodotto;

  ProdottoScreen(this.prodotto);

  @override
  _ProdottoScreenState createState() => _ProdottoScreenState();
}

class _ProdottoScreenState extends State<ProdottoScreen> {
  late Product currentProduct;

  @override
  void initState() {
    super.initState();
    currentProduct = widget.prodotto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
         automaticallyImplyLeading: false,
         leading:            
         IconButton(
              icon: Icon(Icons.arrow_back, color: Colors.blue),
              onPressed: () async {
                await Navigator.push(
                  context,
                  PageTransition(type: PageTransitionType.rightToLeftWithFade,
                  child: ItemsScreen())
                );
                setState(() {
                });
              },
            ),
          title: Text(currentProduct.product,
              style: TextStyle(color: Colors.blue)),
          actions: [
            IconButton(
              icon: Icon(Icons.edit, color: Colors.blue),
              onPressed: () async {
                final updated = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        EditProductPage(product: currentProduct),
                  ),
                );

                if (updated != null && updated is Product) {
                  setState(() {
                    currentProduct = updated;
                  });
                }
              },
            ),
           
          ],
          backgroundColor: Color.fromARGB(255, 58, 118, 166),
        ),
        backgroundColor: Color.fromARGB(255, 156, 190, 218),
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
                      currentProduct.thumbnail,
                      width: 200,
                      height: 200,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Prezzo: ${currentProduct.price}€',
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 27, 95, 150)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Categoria: ${currentProduct.category}',
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 27, 95, 150)),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'Descrizione: ' + currentProduct.description,
                    style: TextStyle(
                        fontSize: 20,
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
