import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  _LoginPageState createState() {
    return _LoginPageState();
  }
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text('errSmart Login'),
          centerTitle: true,
          foregroundColor: const Color.fromARGB(255, 36, 69, 168),
          backgroundColor: const Color.fromARGB(255, 88, 121, 164)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'), style: TextStyle(color: Colors.blue),
            ),
            TextField(
              controller: _passwordController,
              decoration: InputDecoration(labelText: 'Password'),
              obscureText: true,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _login, // Funzione per la logica di autenticazione
              child: Text('Accedi'),
            ),
          ],
        ),
      ),
    );
  }


 Future<void> _login() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    try {
      // Esegui la richiesta POST
      var jsonEncode2 = jsonEncode(password);
      var response = await http.post(
        Uri.parse('https://capstone-project-server-sy5q.onrender.com/login'), // Cambia con il tuo endpoint
        body: ({
          'email': email,
          'password': jsonEncode2,
        }),
        headers: {'Content-Type': 'application/json'},
      );

      // Verifica la risposta del server
      if (response.statusCode == 200) {
        // Il login è riuscito, gestisci la risposta
        var data = jsonDecode(response.body);
        if (data['success']) {
          // Login corretto, naviga verso la pagina successiva
          Navigator.pushReplacementNamed(context, '/home');
        } else {
          // Mostra un messaggio di errore
          _showError('Login fallito: credenziali non valide.');
        }
      } else {
        // Errore del server o richiesta non riuscita
        _showError('Errore di connessione: ${response.statusCode}');
      }
    } catch (e) {
      // Gestisci gli errori di rete
      _showError('Si è verificato un errore: $e');
    }
  }

  // Funzione per mostrare un messaggio di errore
  void _showError(String message) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Errore'),
          content: Text(message),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  }
}
