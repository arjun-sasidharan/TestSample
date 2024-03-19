import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_sample/config/url_helper.dart';
import 'package:test_sample/domain/i_products_repository.dart';
import 'package:test_sample/domain/product_list_model.dart';
import 'package:test_sample/network/network.dart';
import 'package:test_sample/storage/storage.dart';

class ProductsRepository extends IProductsRepository {
  @override
  Future<Either<String, List<ProductItem>>> fetchProducts() async {
    try {
      String? userLoginToken = await Storage.read("token");
      if (userLoginToken != null) {
        final formData = FormData.fromMap({
          "user_login_token": userLoginToken,
        });
        Response? response = await apiClient.request(
            url: UrlHelper.fetchProductUrl,
            method: HTTPMethod.post,
            data: formData,
        );
        if (response != null) {
          final resList = response.data as List;
          return right(resList.map((e) => ProductItem.fromJson(e)).toList());
        } else {
          return left("Something went wrong");
        }
      } else {
        return left("Something went wrong");
      }
    } catch (e) {
      return left("Something went wrong");
    }
  }
}