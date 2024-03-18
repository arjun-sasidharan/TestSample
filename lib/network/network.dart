import 'package:dio/dio.dart';

final apiBaseHelper = ApiBaseHelper();

class ApiBaseHelper {
  final Dio dio = Dio(BaseOptions(
    responseType: ResponseType.json,
  ));
}