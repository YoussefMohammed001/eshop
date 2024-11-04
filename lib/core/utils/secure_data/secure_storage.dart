import 'package:eshop/core/utils/secure_data/secure_keys.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static  const FlutterSecureStorage _storage = FlutterSecureStorage();

  static Future<void> writeData(SecureKeys key, String value) async {
    await _storage.write(key: key.name, value: value);
  }

  static Future<String?> readData(SecureKeys secureKeys) async {
    return await _storage.read(key: secureKeys.name);
  }

  static Future<void> deleteData(SecureKeys secureKeys) async {
    await _storage.delete(key: secureKeys.name);
  }

  static Future<void> deleteAllData() async {
    await _storage.deleteAll();
  }
}