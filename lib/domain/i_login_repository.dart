import 'package:dartz/dartz.dart';
import 'package:test_sample/domain/login_response_model.dart';

abstract class ILoginRepository {
  Future<Either<String, User?>> login(String emailId, String password);
}