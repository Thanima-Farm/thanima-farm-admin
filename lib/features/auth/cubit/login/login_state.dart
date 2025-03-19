import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginState extends Equatable {
  const LoginState();

  @override
  List<Object?> get props => [];
}

class LoginInitialState extends LoginState {}

class LoginLoadingState extends LoginState {}

class LoginOtpSendSuccessState extends LoginState {}

// class LoginOtpSendFailed extends LoginState {
//   final String message;
//
//   const LoginOtpSendFailed({required this.message});
//
//   @override
//   List<Object?> get props => [message];
// }

// class LoginOtpVerifyLoadingState extends LoginState {}

// class LoginOtpVerifyFailed extends LoginState {
//   final String message;
//
//   const LoginOtpVerifyFailed({required this.message});
//
//   @override
//   List<Object?> get props => [message];
// }

class LoginSuccessState extends LoginState {
  final User? user;

  const LoginSuccessState({required this.user});

  @override
  List<Object?> get props => [user];
}

class LoginErrorState extends LoginState {
  final String error;

  const LoginErrorState({required this.error});

  @override
  List<Object?> get props => [error];
}
