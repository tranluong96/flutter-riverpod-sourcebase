class Product {
  const Product({
    required this.id,
    required this.name,
    required this.description,
    required this.category,
    required this.price,
  });

  final int id;
  final String name;
  final String description;
  final String category;
  final double price;
}
