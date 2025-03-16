import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isLoading = false;

  Future<void> login() async {
    final String apiUrl =
        "https://capstone-project-server-sy5q.onrender.com/login";

    setState(() {
      isLoading = true;
    });

    final response = await http.post(
      Uri.parse(apiUrl),
      headers: {"Content-Type": "application/json"},
      body: jsonEncode({
        "email": emailController.text,
        "password": passwordController.text,
      }),
    );

    setState(() {
      isLoading = false;
    });

    if (response.statusCode == 200) {
      final token = response.body;
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', token); // Salva il token

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login effettuato con successo!")),
      );

      Navigator.pushReplacementNamed(context, '/home'); // Naviga alla home
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Errore: ${response.body}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Benvenuto su ErrSmart", style: TextStyle(color: Color.fromARGB(255, 156, 190, 218)),),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 58, 118, 166),
      ),
      backgroundColor: const Color.fromARGB(255, 93, 159, 213),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: emailController,
              decoration: InputDecoration(labelText: "Email", labelStyle: TextStyle(color: Color.fromARGB(255, 58, 118, 166),
)),
              keyboardType: TextInputType.emailAddress,style: TextStyle(color: Color.fromARGB(255, 58, 118, 166),),
              
            ),
            TextField(
              controller: passwordController,
              decoration: InputDecoration(labelText: "Password"),
              obscureText: true,
            ),
            SizedBox(height: 20),
            isLoading
                ? CircularProgressIndicator()
                : ElevatedButton(
                    onPressed: login,
                    child: Text("Login"),
                  ),
          ],
        ),
      ),
    );
  }
}
