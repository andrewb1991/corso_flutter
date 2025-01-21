class Product {
  late final String id;
 late final String product;
  late final String thumbnail;
  late final String description;
  late final String category;
  late final String price;
  
  Product(
      {required this.id,
    required this.product,
    required this.thumbnail,
    required this.category,
    required this.description,
    required this.price});

 Product.fromMap(Map<String, dynamic> json) {
    id = json['id'];
    product = json['product'];
    price = (json['price'] == null) ? '' : json['price'].toString();
    description =
        (json['description'] == null) ? '' : json['description'].toString();
    category =
        (json['category'] == null) ? '' : json['category'].toString();

      thumbnail = (json['thumbnail'] == null) 
        ? '' 
        : json['thumbnail'].toString();
    }
}
    



