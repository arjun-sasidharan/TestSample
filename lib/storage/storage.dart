import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<String?> read(String key) async {
    try {
      return await storage.read(key: key);
    } catch (e) {
      return "";
    }
  }

  static Future<String> write(
    String key,
    String value,
  ) async {
    try {
      await storage.write(key: key, value: value);
      return "Success";
    } catch (e) {
      return "Error while reading file";
    }
  }
}
