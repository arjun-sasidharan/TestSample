import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:test_sample/domain/product_list_model.dart';
import 'package:test_sample/infrastructure/products_repository.dart';

class ProductController extends GetxController {
  final ProductsRepository _productsRepository = ProductsRepository();
  List<ProductItem> products = [];
  bool isLoading = false;
  String errorMessage = "";

  @override
  void onInit() {
    fetchProducts();
    super.onInit();
  }

  fetchProducts() async {
    isLoading = true;
    update();

    Either<String, List<ProductItem>> res = await _productsRepository.fetchProducts();
    isLoading = false;
    res.fold((l) {
      errorMessage = l;
    }, (r) {
      products = r;
    });

    update();
  }



}