import 'package:errstore/src/products.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiService {
  static const String baseUrl = "https://capstone-project-server-sy5q.onrender.com/allproducts";

  Future<List<Product>> fetchItems() async {
    final response = await http.get(Uri.parse(baseUrl));

    if (response.statusCode == 200) {
      List<dynamic> data = jsonDecode(response.body);
      return data.map((json) => Product.fromMap(json)).toList();
    } else {
      throw Exception("Errore durante il recupero dei dati");
    }
  }
}
