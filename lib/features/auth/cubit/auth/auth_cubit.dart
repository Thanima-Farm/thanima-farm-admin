// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

// enum AuthState { initial, loading, authenticated, unauthenticated }

// class AuthCubit extends Cubit<AuthState> {
//   AuthCubit() : super(AuthState.initial);

//   Future<void> checkAuth() async {
//     emit(AuthState.loading);
//     // FirebaseAuth auth = FirebaseAuth.instance;
//     // User? user = auth.currentUser;
//     // if (user != null) {
//     emit(AuthState.authenticated);
//     // } else {
//     //   emit(AuthState.unauthenticated);
//     // }
//   }
// }

import 'package:flutter_bloc/flutter_bloc.dart';

// Auth State
enum AuthState { initial, loading, authenticated, unauthenticated }

// class AuthInitial extends AuthState {}

// class AuthAuthenticated extends AuthState {}

// class AuthUnauthenticated extends AuthState {}

// class AuthLoading extends AuthState {}

// class AuthFailure extends AuthState {
//   final String error;
//   AuthFailure(this.error);
// }

// Auth Cubit (Cubit for Authentication Logic)
class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthState.initial);

  void checkAuth() {
    emit(AuthState.loading);
    Future.delayed(Duration(seconds: 2), () {
      if (1 == 1) {
        emit(AuthState.authenticated);
      } else {
        emit(AuthState.unauthenticated);
      }
    });
  }

  void logout() {
    emit(AuthState.unauthenticated);
  }
}
