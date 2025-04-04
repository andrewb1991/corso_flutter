import 'dart:math';

import 'package:flutter/material.dart';
import 'products.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class EditProductPage extends StatefulWidget {
  final Product product;

  const EditProductPage({Key? key, required this.product}) : super(key: key);

  @override
  _EditProductPageState createState() => _EditProductPageState();
}

class _EditProductPageState extends State<EditProductPage> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController descriptionController;
    late TextEditingController categoryController;  
    late TextEditingController thumbnailController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product.product);
    priceController =
        TextEditingController(text: widget.product.price.toString());
    descriptionController =
        TextEditingController(text: widget.product.description);
    categoryController =
        TextEditingController(text: widget.product.category);    
       thumbnailController =
        TextEditingController(text: widget.product.thumbnail);
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    descriptionController.dispose();
    categoryController.dispose();
    thumbnailController.dispose();

    super.dispose();
  }

   Future<void> editProduct(String id) async {
      final url = Uri.parse(
          'https://capstone-project-server-sy5q.onrender.com/allproducts/$id');
      final response = await http.patch(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // Usa jsonEncode per convertire la mappa in una stringa JSON
          'product': nameController.text,
          'description': descriptionController.text,
          'price': priceController.text,
          'thumbnail': thumbnailController.text,
          'category': categoryController.text,

        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
      final updatedProduct = Product(
      id: widget.product.id,
      product: nameController.text,
      description: descriptionController.text,
      price: priceController.text,
      category: widget.product.category,
      thumbnail: widget.product.thumbnail,
  );

     Navigator.pop(context, updatedProduct);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prodotto modificato con successo!'),behavior: SnackBarBehavior.floating, backgroundColor: Colors.blue),
        );
      } 
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore durante la modifica del prodotto: $e'), behavior: SnackBarBehavior.floating),
        );
      }
    
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifica', textAlign: TextAlign.center, style: TextStyle(color: Colors.blue)),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 118, 166),
      ),
      backgroundColor: const Color.fromARGB(255, 156, 190, 218),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: "Nome prodotto"),style: TextStyle(color: Color.fromARGB(255, 58, 118, 166)),
            ),
            TextField(
              controller: priceController,
              decoration: InputDecoration(labelText: "Prezzo"),style: TextStyle(color: Color.fromARGB(255, 58, 118, 166)),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(labelText: "Descrizione"), style: TextStyle(color: Color.fromARGB(255, 58, 118, 166)),
              maxLines: 4,
            ),
                        TextField(
              controller: categoryController,
              decoration: InputDecoration(labelText: "Categoria prodotto"),style: TextStyle(color: Color.fromARGB(255, 58, 118, 166)),
            ),
            TextField(
              controller: thumbnailController,
              decoration: InputDecoration(labelText: "URL immagine prodotto"),style: TextStyle(color: Color.fromARGB(255, 58, 118, 166)),
            ),

            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => editProduct(widget.product.id),
              child: Text("Salva modifiche"),
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 58, 118, 166),
                foregroundColor: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
