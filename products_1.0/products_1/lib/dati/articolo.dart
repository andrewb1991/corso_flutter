class Articolo {
  int? id;
  late String nome;
  late String quantita;
  String? note;
  Articolo(this.nome, this.quantita, this.note);

  Articolo.daMap(Map<String, dynamic> map) {
    id = map['id'];
    nome = map['nome'];
    quantita = map['quantita'];
    note = map['note'];
  }

  Map<String, dynamic> trasformaInMap() {
    return {'id': id, 'nome': nome, 'quantita': quantita, 'note': note};
  }
}
