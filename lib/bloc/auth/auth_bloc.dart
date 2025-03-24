import 'package:flutter_bloc/flutter_bloc.dart';
import 'auth_event.dart';
import 'auth_state.dart';
import '../../repositories/auth_repository.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;

  AuthBloc(this.authRepository) : super(AuthInitial()) {
    on<LoginRequested>((event, emit) async {
      emit(AuthLoading()); // Show loading state
      try {
        final user = await authRepository.login(event.email, event.password);
        emit(AuthSuccess(user)); // Login successful
      } catch (e) {
        print(e);
        emit(AuthFailure("Invalid credentials"));
      }
    });
  }
}
