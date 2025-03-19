import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

enum AuthState { initial, loading, authenticated, unauthenticated }

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial);

  Future<void> checkAuth() async {
    emit(AuthState.loading);
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user = auth.currentUser;
    if (user != null) {
      emit(AuthState.authenticated);
    } else {
      emit(AuthState.unauthenticated);
    }
  }
}
