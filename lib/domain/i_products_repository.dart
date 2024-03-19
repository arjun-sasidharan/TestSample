import 'package:dartz/dartz.dart';
import 'package:test_sample/domain/product_list_model.dart';

abstract class IProductsRepository {
  Future<Either<String, List<ProductItem>>> fetchProducts();
}