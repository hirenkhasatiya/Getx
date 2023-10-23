class Product {
  int id, price;
  String title, description, category, thumbnail;
  List images;

  Product(
      {required this.id,
      required this.title,
      required this.description,
      required this.category,
      required this.price,
      required this.thumbnail,
      required this.images});

  factory Product.fromJson({required Map<String, dynamic> data}) => Product(
        title: data['title'],
        id: data['id'],
        category: data['category'],
        description: data['description'],
        images: data['images'],
        price: data['price'],
        thumbnail: data['thumbnail'],
      );
}
