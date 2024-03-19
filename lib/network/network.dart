import 'dart:io';

import 'package:dio/dio.dart';
import 'package:test_sample/config/url_helper.dart';
import 'package:test_sample/storage/storage.dart';

enum HTTPMethod { get, post, }

final apiClient = ApiBaseHelper();

Dio addInterceptor(Dio dio) {
  dio.interceptors.add(CookieStorage());
  dio.interceptors.add(CustomHeader());
  return dio;
}

class ApiBaseHelper {
  static final Dio _dio = Dio(BaseOptions(
    responseType: ResponseType.json,
    connectTimeout: const Duration(seconds: 30000),
    receiveTimeout: const Duration(seconds: 30000),
  ));

  static final Dio _baseApi = addInterceptor(_dio);

  Future<Response?> request({
    required String url,
    dynamic data,
    HTTPMethod method = HTTPMethod.get,
    Map<String, dynamic>? headers,
  }) async {
    Response? response;
    try {
      switch (method) {
        case HTTPMethod.get:
          response = await _baseApi.get(url,
              data: data, options: Options(headers: headers));
          break;
        case HTTPMethod.post:
          response = await _baseApi.post(url,
              data: data, options: Options(headers: headers));
          break;

        default:
      }
    } on DioException catch (error) {
      error.response;
    }
    return response;
  }
}

class CookieStorage extends Interceptor {
  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    await _storeCookie(response);
    super.onResponse(response, handler);
  }

  Future<void> _storeCookie(Response response) async {
      if(response.requestOptions.path == UrlHelper.loginUrl) {
        List<String>? cookies = response.headers[HttpHeaders.setCookieHeader];
        cookies?.forEach((element) {
          Storage.write("cookie", element);
        });
      }
  }
}

class CustomHeader extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final cookie = await Storage.read("cookie");
    options.headers[HttpHeaders.cookieHeader] = cookie;
    return super.onRequest(options, handler);
  }
}