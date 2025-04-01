import 'package:thanima_admin/core/routes/router.dart';
import 'package:thanima_admin/features/auth/cubit/auth/auth_cubit.dart';
import 'package:thanima_admin/features/auth/ui/login_screen.dart';
import 'package:thanima_admin/features/layout/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit()..checkAuth(),
      child: const AuthPage(),
    );
  }
}

class AuthPage extends StatelessWidget {
  const AuthPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state == AuthState.authenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.homePageRoute,
            (route) => false,
          );
        }
        if (state == AuthState.unauthenticated) {
          Navigator.pushNamedAndRemoveUntil(
            context,
            Routes.loginScreenRoute,
            (route) => false,
          );
        }
      },
      builder: (context, state) {
        if (state == AuthState.authenticated) {
          return const HomePage();
        } else if (state == AuthState.unauthenticated) {
          return const LoginScreen();
        }
        return const LoginScreen();
      },
    );
  }
}
