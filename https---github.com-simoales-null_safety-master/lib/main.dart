import 'package:flutter/material.dart';
import './stati_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Null Safety',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home: const StatiScreen(),
    );
  }
}
