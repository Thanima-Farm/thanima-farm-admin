import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:thanima_admin/core/services/api_client.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_cubit.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(), // Providing LoginCubit to this screen
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFCDEDFF), Color(0xFFF4FDF4)],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 589,
                      width: 974,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                        border: Border.all(color: Color(0xFFBFF5DE)),
                        color: Color(0xFFBFF5DE),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(width: 15),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5.0),
                                ),
                                border: Border.all(color: Color(0xFFBFF5DE)),
                              ),
                              width: 348,
                              height: 457,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Welcome to App Name",
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    SizedBox(height: 2),
                                    Text(
                                      "This system is a tool to manage and operate whole system easily.",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(height: 30),
                                    Text(
                                      "Login to DashBoard",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    SizedBox(height: 15),
                                    TextField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 11),
                                        prefixIcon: Icon(
                                          Icons.notes_outlined,
                                          color: Color(0xFFB7B7B7),
                                        ),
                                        hintText: "Enter Username",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 10),
                                    TextField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 11),
                                        prefixIcon: Icon(
                                          Icons.lock,
                                          color: Color(0xFFB7B7B7),
                                        ),
                                        hintText: "Enter Password",
                                        border: OutlineInputBorder(),
                                      ),
                                    ),
                                    SizedBox(height: 80),
                                    Center(
                                      child: BlocConsumer<
                                        LoginCubit,
                                        LoginState
                                      >(
                                        listener: (context, state) {
                                          if (state is LoginSuccess) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(
                                                  "Login Successful!",
                                                ),
                                              ),
                                            );
                                            // Navigate to the Dashboard or another screen
                                          } else if (state is LoginFailure) {
                                            ScaffoldMessenger.of(
                                              context,
                                            ).showSnackBar(
                                              SnackBar(
                                                content: Text(state.error),
                                              ),
                                            );
                                          }
                                        },
                                        builder: (context, state) {
                                          if (state is LoginLoading) {
                                            return CircularProgressIndicator();
                                          }
                                          return ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Color(
                                                0xFF000000,
                                              ),
                                              foregroundColor: Colors.white,
                                              padding: EdgeInsets.symmetric(
                                                horizontal: 80,
                                                vertical: 16,
                                              ),
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(4),
                                              ),
                                            ),
                                            onPressed: () {
                                              // Call the login method from LoginCubit
                                              context.read<LoginCubit>().login(
                                                _usernameController.text,
                                                _passwordController.text,
                                              );
                                            },
                                            child: Text(
                                              "Login",
                                              style: TextStyle(fontSize: 12),
                                            ),
                                          );
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/login_image.png', // Path to your image
                            width: 500, // Set specific width
                            height: 666, // Set specific height
                            fit:
                                BoxFit
                                    .cover, // Adjust how the image fits within the box
                          ),
                        ],
                      ),
                    ),
                    Text(
                      "Elevating Hospitality for a Luxurious & Seamless Experience",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
