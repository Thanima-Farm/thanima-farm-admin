import '../models/user_model.dart';
import '../services/auth_service.dart';

class AuthRepository {
  final AuthService _authService;

  AuthRepository(this._authService);

  Future<UserModel> login(String email, String password) async {
    final data = await _authService.login(email, password);
    return UserModel.fromJson(data);
  }
}
