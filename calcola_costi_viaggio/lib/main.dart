import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Calcola Costi Viaggio',
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
        seedColor: Colors.orange,
      )),
      home: const CalcolaCostiScreen(),
    );
  }
}

class CalcolaCostiScreen extends StatefulWidget {
  const CalcolaCostiScreen({super.key});

  @override
  State<CalcolaCostiScreen> createState() => _CalcolaCostiScreenState();
}

class _CalcolaCostiScreenState extends State<CalcolaCostiScreen> {
  String tipoPercorso = 'Urbano';
  String messaggio = '';
  final TextEditingController chilometriController = TextEditingController();

  final List<String> tipiPercorso = ['Urbano', 'Extraurbano', 'Misto'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
            title: const Text('Calcola Costo del Viaggio',
                style: TextStyle(color: Colors.blue))),
        body: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(children: [
            TextField(
              controller: chilometriController,
              keyboardType: TextInputType.number,
              style: TextStyle(fontSize: 20, color: Colors.grey[800]),
              decoration: InputDecoration(
                hintText: 'Inserisci il numero di KM effettuati',
                hintStyle: TextStyle(fontSize: 18),
              ),
            ),
            const Spacer(),
            DropdownButton<String>(
              value: tipoPercorso,
              items: tipiPercorso.map((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(value,
                      style: TextStyle(fontSize: 20, color: Colors.grey[800])),
                );
              }).toList(),
              onChanged: (String? nuovoValore) {
                setState(() {
                  tipoPercorso = nuovoValore!;
                });
              },
            ),
            const Spacer(flex: 2),
            ElevatedButton(
                onPressed: () {
                  print('Chilometri ${chilometriController.text}');
                  calcolaCosto();
                },
                child: const Text('Calcola Costo',
                    style: TextStyle(color: Colors.blue, fontSize: 20))),
            Text(messaggio,
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.grey[800],
                )),
          ]),
        ));
  }

  void calcolaCosto() {
    const costoLitroCarburante = 1.8;
    double numeroChilometri = double.tryParse(chilometriController.text) ?? 0;
    double chilometriTipoPercorso;
    double costo;
    if (tipoPercorso == tipiPercorso[0]) {
      chilometriTipoPercorso = 14;
    } else if (tipiPercorso == tipiPercorso[1]) {
      chilometriTipoPercorso = 12;
    } else {
      chilometriTipoPercorso = 16;
    }
    costo = numeroChilometri * costoLitroCarburante / chilometriTipoPercorso;
    setState(() {
      messaggio =
          'Il costo previsto per il tuo viaggio è di € ${costo.toString()}';
    });
  }
}
