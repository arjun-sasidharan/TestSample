abstract class ILoginRepository {
  Future<String> login(String userId, String password);
}