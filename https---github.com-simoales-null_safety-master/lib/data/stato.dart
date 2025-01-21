class Stato {
  String countryCode;
  String countryName;
  String currencyCode;
  String population;
  String capital;
  String continentName;

  Stato(
    this.countryCode,
    this.countryName,
    this.currencyCode,
    this.population,
    this.capital,
    this.continentName,
  );

  // Stato.fromMap(Map<String, dynamic> map) {
  //   countryCode = map['countryCode'] as String;
  //   countryName = map['countryName'] as String;
  //   currencyCode = map['currencyCode'] as String?;
  //   population = map['population'] as String?;
  //   capital = map['capital'] as String;
  //   continentName = map['continentName'] as String;
  // }
}
