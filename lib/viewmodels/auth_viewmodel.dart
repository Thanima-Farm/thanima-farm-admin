import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/auth/auth_bloc.dart';
import '../bloc/auth/auth_event.dart';

class AuthViewModel {
  final AuthBloc authBloc;

  AuthViewModel(this.authBloc);

  void login(String email, String password) {
    authBloc.add(LoginRequested(email: email, password: password));
  }
}
