import 'package:equatable/equatable.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// Login States
abstract class LoginState {}

class LoginInitial extends LoginState {}

class LoginLoading extends LoginState {}

class LoginSuccess extends LoginState {}

class LoginFailure extends LoginState {
  final String error;
  LoginFailure(this.error);
}
