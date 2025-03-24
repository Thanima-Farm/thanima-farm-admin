import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/app.dart';
import 'package:thanima_admin/bloc/auth/auth_bloc.dart';
import 'package:thanima_admin/repositories/auth_repository.dart';
import 'package:thanima_admin/services/auth_service.dart';

void main() {
  final authRepository = AuthRepository(AuthService());

  runApp(
    MultiBlocProvider(
      providers: [BlocProvider(create: (context) => AuthBloc(authRepository))],
      child: const MyApp(),
    ),
  );
}
