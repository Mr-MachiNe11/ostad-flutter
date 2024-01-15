class ProductModel {
  final String name;
  final String size;
  final double price;
  final String image;
  final String color;
  int qty;

  ProductModel({
    required this.name,
    required this.size,
    required this.price,
    required this.image,
    required this.color,
    this.qty = 1,
  });
}