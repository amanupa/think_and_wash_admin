import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> writeData({
    required String key,
    required String value,
  }) async {
    await _storage.write(key: key, value: value);
  }

  static Future<String?> readData({required String key}) async {
    return await _storage.read(key: key);
  }

  static Future<void> deleteData({required String key}) async {
    await _storage.delete(key: key);
  }

  static Future<void> deleteAll() async {
    await _storage.deleteAll();
  }
}
