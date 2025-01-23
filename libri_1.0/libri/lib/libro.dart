class Libro {
  late String id;
  late String titolo;
  late String autori;
  late String descrizione;
  late String editore;
  late String immagineCopertina;

  Libro(this.id, this.titolo, this.autori, this.descrizione, this.editore, this.immagineCopertina);

  Libro.fromMap(Map<String, dynamic> mappa){
 id = mappa['id'];
    titolo = mappa['volumeInfo']['title'];
    autori = (mappa['volumeInfo']['authors'] == null) 
      ? '' 
      : mappa['volumeInfo']['authors'].toString();
    descrizione = (mappa['volumeInfo']['description'] == null) 
      ? '' 
      : mappa['volumeInfo']['description'].toString();
    editore = (mappa['volumeInfo']['publisher'] == null) 
      ? '' 
      : mappa['volumeInfo']['publisher'].toString();
    try {
      immagineCopertina = (mappa['volumeInfo']['imageLinks']['smallThumbnail'] == null) 
        ? '' 
        : mappa['volumeInfo']['imageLinks']['smallThumbnail'].toString();
    }
    catch (errore) {
      immagineCopertina = '';
    }
     
  }
}

