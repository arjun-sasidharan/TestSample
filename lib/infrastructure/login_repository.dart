import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:test_sample/config/url_helper.dart';
import 'package:test_sample/domain/i_login_repository.dart';
import 'package:test_sample/domain/login_response_model.dart';
import 'package:test_sample/network/network.dart';

class LoginRepository extends ILoginRepository {
  @override
  Future<Either<String, User?>> login(String emailId, String password) async {
    try {
      final formData = FormData.fromMap({
        "email": emailId,
        "password": password,
      });

      Response? response = await apiClient.request(
          url: UrlHelper.loginUrl,
          method: HTTPMethod.post,
          data: formData
      );
      if (response != null) {
        LoginResponseModel model = LoginResponseModel.fromJson(response.data);
        if (model.data != null) {
          return right (model.data);
        } else {
          return left(model.message ?? "Something went wrong");
        }
      } else {
        return left("Something went wrong");
      }
    } catch (e) {
      return left("Something went wrong");
    }
  }
}
