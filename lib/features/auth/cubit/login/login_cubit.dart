import 'package:thanima_admin/features/auth/cubit/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginCubit extends Cubit<LoginState> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String? verificationId;

  LoginCubit() : super(LoginInitialState());

  // Stream<LoginState> mapEventToState(LoginEvent event) async* {
  //   if (event is SendOtp) {
  //     yield* _mapSubmitPhoneNumber(event.mobileNumber);
  //   } else if (event is ReSendOtp) {
  //     yield* _mapSubmitPhoneNumber(event.mobileNumber);
  //   } else if (event is VerifyOtp) {
  //     yield* _mapVerifyOtp(event.otp);
  //   } else if (event is LogOutEvent) {
  //     yield* _mapLogOut();
  //   }
  // }

  Future<void> login(String username, String password) async {
    debugPrint("State before emitting loading: $state");
    emit(LoginLoadingState());

    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
        email: username,
        password: password,
      );

      debugPrint("State before emitting success: $state");

      if (userCredential.user != null) {
        emit(LoginSuccessState(user: userCredential.user));
        debugPrint("State after emitting success: $state");
      } else {
        emit(const LoginErrorState(error: 'Login failed. No user found.'));
      }
    } catch (e) {
      if (e is FirebaseAuthException) {
        emit(LoginErrorState(error: e.message ?? 'An unknown error occurred.'));
      } else {
        emit(const LoginErrorState(error: 'Something went wrong. Try again.'));
      }
      debugPrint("State after emitting error: $state");
    }
  }

  Future<void> submitPhoneNumber(String mobileNumber) async {
    debugPrint("state is: $state");
    emit(LoginLoadingState());
    try {
      await _auth.verifyPhoneNumber(
        phoneNumber: "+91$mobileNumber",
        verificationCompleted: (PhoneAuthCredential credential) {},
        verificationFailed: (FirebaseAuthException e) {
          emit(LoginErrorState(error: e.message ?? 'Verification failed'));
        },
        codeSent: (String verificationId, int? resendToken) {
          this.verificationId = verificationId;
          emit(LoginOtpSendSuccessState());
        },
        codeAutoRetrievalTimeout: (String verificationId) {},
      );
    } catch (e) {
      emit(const LoginErrorState(
          error: 'Failed to send OTP. Please try again.'));
    }
  }

  // Future<void> verifyOtp(String otp) async {
  //   emit(LoginLoadingState());
  //   try {
  //     PhoneAuthCredential credential = PhoneAuthProvider.credential(
  //       verificationId: verificationId!,
  //       smsCode: otp,
  //     );
  //     UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     emit(LoginOtpVerifySuccessState(user: userCredential.user));
  //   } catch (e) {
  //     emit(const LoginErrorState(error: 'Invalid OTP. Please try again.'));
  //   }
  // }

  Future<void> logOut() async {
    try {
      await _auth.signOut();
      emit(LoginInitialState());
    } catch (e) {
      emit(const LoginErrorState(
          error: 'Failed to sign out. Please try again.'));
    }
  }
}
