import 'package:thanima_admin/core/config/secure_storage_keys.dart';
import 'package:thanima_admin/core/services/secure_storage_service.dart';

class TokenStorageService {
  final _storage = SecureStorageService();
  static const _tokenKey = SecureStorageKeys.authToken;

  Future<void> saveToken(String token) async {
    await _storage.write(_tokenKey, token);
  }

  Future<String?> getToken() async {
    return await _storage.read(_tokenKey);
  }

  Future<void> clearToken() async {
    await _storage.delete(_tokenKey);
  }
}
