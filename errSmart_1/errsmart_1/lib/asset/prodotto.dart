class Prodotto {
  late String id;
  late String product;
  late String price;
  late String description;
  late String category;
  late String thumbnail;

  Prodotto(this.id, this.product, this.price, this.description, this.category, this.thumbnail);

  Prodotto.fromMap(Map<String, dynamic> mappa){
 this.id = mappa['id'];
    this.product = mappa['volumeInfo']['product'];
    this.price = (mappa['volumeInfo']['price'] == null) 
      ? '' 
      : mappa['volumeInfo']['authors'].toString();
    this.description = (mappa['volumeInfo']['description'] == null) 
      ? '' 
      : mappa['volumeInfo']['description'].toString();
    this.price = (mappa['volumeInfo']['price'] == null) 
      ? '' 
      : mappa['volumeInfo']['price'].toString();
    try {
      this.thumbnail = (mappa['volumeInfo']['imageLinks']['thumbnail'] == null) 
        ? '' 
        : mappa['volumeInfo']['imageLinks']['thumbnail'].toString();
    }
    catch (errore) {
      this.thumbnail = '';
    }
     
  }
}

