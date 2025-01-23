class Prodotto {
  late String id;
  late String product;
  late String price;
  late String description;
  late String category;
  late String thumbnail;

  Prodotto(this.id, this.product, this.price, this.description, this.category, this.thumbnail);

  Prodotto.fromMap(Map<String, dynamic> mappa){
 id = mappa['id'];
    product = mappa['volumeInfo']['product'];
    price = (mappa['volumeInfo']['price'] == null) 
      ? '' 
      : mappa['volumeInfo']['authors'].toString();
    description = (mappa['volumeInfo']['description'] == null) 
      ? '' 
      : mappa['volumeInfo']['description'].toString();
    price = (mappa['volumeInfo']['price'] == null) 
      ? '' 
      : mappa['volumeInfo']['price'].toString();
    try {
      thumbnail = (mappa['volumeInfo']['imageLinks']['thumbnail'] == null) 
        ? '' 
        : mappa['volumeInfo']['imageLinks']['thumbnail'].toString();
    }
    catch (errore) {
      thumbnail = '';
    }
     
  }
}

