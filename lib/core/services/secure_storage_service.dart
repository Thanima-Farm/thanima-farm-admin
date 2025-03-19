import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static final SecureStorageService _instance =
      SecureStorageService._internal();

  factory SecureStorageService() => _instance;

  SecureStorageService._internal();

  final FlutterSecureStorage _secureStorage = const FlutterSecureStorage();

  Future<void> write(String key, String value) async {
    await _secureStorage.write(key: key, value: value);
  }

  Future<String?> read(String key) async {
    return await _secureStorage.read(key: key);
  }

  Future<void> delete(String key) async {
    await _secureStorage.delete(key: key);
  }

  Future<bool> containsKey(String key) async {
    return await _secureStorage.containsKey(key: key);
  }

  /// Clear all values from secure storage
  Future<void> clear() async {
    await _secureStorage.deleteAll();
  }
}
