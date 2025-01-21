import 'dart:convert';
import 'package:flutter/services.dart';
import 'stato.dart';

class StatoHelper {
  final List<Stato> stati = [];

  Future<List<Stato>> getStati() async {
    final data = await rootBundle.loadString('assets/stati.json');
    final dynamic jsonData = jsonDecode(data);
    final countriesData = jsonData['countries'] as List;

    // ignore: avoid_annotating_with_dynamic
    countriesData.forEach((dynamic countryData) {
      // ignore: unused_local_variable
      final statoMap = countryData as Map<String, dynamic>;
      //stati.add(Stato.fromMap(statoMap));
    });
    return stati;
  }
}
