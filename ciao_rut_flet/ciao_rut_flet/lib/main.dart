import 'package:flutter/material.dart';

void main() => runApp(RutApp());

class RutApp extends StatelessWidget {
  const RutApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Rut Flet',
        theme: ThemeData(
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.green)),
        home: Scaffold(
            appBar: AppBar(
              title: const Text('Gelateria da Rut Flet', style:TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.bold,
              )),
            ),
            body: Builder(builder: (context) {
              return SingleChildScrollView(
                child: Column(children: [
                Container(height:50,),
                  const Text('Il gelato migliore del mondo',
                  style: TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold)),
                Container(height:50,),
                  Image.network(
                      'https://www.shutterstock.com/shutterstock/photos/2436310721/display_1500/stock-vector-continuous-one-line-ice-cream-hand-drawn-soft-serve-frozen-desserts-cold-popsicles-and-sundaes-2436310721.jpg'),
                Container(height:100,),
                  ElevatedButton(
                      onPressed: () {
                        SnackBar snackBar = const SnackBar(
                            content: Text('La mail di Rut è rut@flet.dev'));
                        ScaffoldMessenger.of(context).showSnackBar(snackBar);
                      },
                      child: const Text('Informazioni', style: TextStyle(
                      color: Colors.blue,
                      fontSize: 20,
                      )),)
                ]),
              );
            })));
  }
}
