import 'package:myapp/domain/models/products/product.dart';
import 'package:myapp/domain/repositories/products/product_repository.dart';

class GetProductsUseCase {
  const GetProductsUseCase(this._repository);

  final ProductRepository _repository;

  Future<List<Product>> call() => _repository.fetchProducts();
}
