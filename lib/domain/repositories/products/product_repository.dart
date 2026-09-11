import 'package:myapp/domain/models/products/product.dart';

abstract interface class ProductRepository {
  Future<List<Product>> fetchProducts();
}
