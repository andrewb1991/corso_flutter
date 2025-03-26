import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddProductPage extends StatefulWidget {
  @override
  _AddProductPageState createState() => _AddProductPageState();
}

class _AddProductPageState extends State<AddProductPage> {
  final _formKey = GlobalKey<FormState>();

  // Controller per i campi di input
  final TextEditingController _productController = TextEditingController();
  final TextEditingController _thumbnailController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _categoryController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();

  // Funzione per inviare i dati al server
  Future<void> _submitProduct() async {
    if (_formKey.currentState!.validate()) {
      final url = Uri.parse(
          'https://capstone-project-server-sy5q.onrender.com/allproducts/');
      final response = await http.post(
        url,
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          // Usa jsonEncode per convertire la mappa in una stringa JSON
          'product': _productController.text,
          'thumbnail': _thumbnailController.text,
          'description': _descriptionController.text,
          'category': _categoryController.text,
          'price': _priceController.text,
        }),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Prodotto aggiunto con successo!')),
        );
Navigator.pushReplacementNamed(context, '/home');
      } 
      else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Errore durante l\'aggiunta del prodotto')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Aggiungi Prodotto'), backgroundColor: const Color.fromARGB(255, 78, 183, 125),),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _productController,
                decoration: InputDecoration(labelText: 'Nome del prodotto'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci il nome del prodotto';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _thumbnailController,
                decoration: InputDecoration(labelText: 'URL immagine'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci l\'URL dell\'immagine';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(labelText: 'Descrizione'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci una descrizione';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _categoryController,
                decoration: InputDecoration(labelText: 'Categoria'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci una categoria';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _priceController,
                decoration: InputDecoration(labelText: 'Prezzo'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Inserisci un prezzo';
                  }
                  return null;
                },
              ),
              SizedBox(height: 100),
              ElevatedButton(
                onPressed: _submitProduct,
                child: Text('Aggiungi Prodotto'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
