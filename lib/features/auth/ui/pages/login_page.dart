import 'package:thanima_admin/core/routes/router.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_cubit.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
// import 'package:theme/theme_const.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final FocusNode mobileFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _usernameController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: BlocConsumer<LoginCubit, LoginState>(listener: (context, state) {
        if (state is LoginSuccessState) {
          Navigator.pushNamedAndRemoveUntil(
              context, Routes.homePageRoute, (route) => false);
        } else if (state is LoginErrorState) {
          Fluttertoast.showToast(msg: state.error);
        }
      }, builder: (context, state) {
        return Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Color(0xFFCDEDFF),
                    Color(0xFFF4FDF4)
                  ], // Gradient colors passed as parameter
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
                          color: Color(0xFFBFF5DE)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 15,
                          ),
                          Center(
                            child: Container(
                              decoration: BoxDecoration(
                                color: Color(0xFFFFFFFF),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(5.0)),
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
                                    SizedBox(
                                      height: 2,
                                    ),
                                    Text(
                                      "This system is a tool to manage and operate whole system easily.",
                                      style: TextStyle(fontSize: 12),
                                    ),
                                    SizedBox(
                                      height: 30,
                                    ),
                                    Text(
                                      "Login to DashBoard",
                                      style: TextStyle(fontSize: 19),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    TextField(
                                      controller: _usernameController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 11),
                                        prefixIcon: Icon(Icons.notes_outlined,
                                            color: Color(0xFFB7B7B7)),
                                        hintText: "Enter Username",
                                        border:
                                            OutlineInputBorder(), // Adds a rectangular border
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    TextField(
                                      controller: _passwordController,
                                      decoration: InputDecoration(
                                        hintStyle: TextStyle(fontSize: 11),
                                        prefixIcon: Icon(Icons.lock,
                                            color: Color(0xFFB7B7B7)),
                                        hintText: "Enter Password",
                                        border:
                                            OutlineInputBorder(), // Adds a rectangular border
                                      ),
                                    ),
                                    SizedBox(
                                      height: 80,
                                    ),
                                    Center(
                                      child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Color(0xFF000000),
                                          foregroundColor: Colors.white,
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 80, vertical: 16),
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                          ),
                                        ),
                                        onPressed: () {
                                          // if (formKey.currentState!
                                          //     .validate()) {
                                          mobileFocusNode.unfocus();
                                          BlocProvider.of<LoginCubit>(context)
                                              .login(_usernameController.text,
                                                  _passwordController.text);
                                          // }
                                        },
                                        child: Text(
                                          "Login",
                                          style: TextStyle(fontSize: 12),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Image.asset(
                            'assets/images/login_image.png', // Path to your image
                            width: 500, // Set specific width
                            height: 666, // Set specific height
                            fit: BoxFit
                                .cover, // Adjust how the image fits within the box
                          )
                        ],
                      ),
                    ),
                    Text(
                      "Elevating Hospitality for a Luxurious & Seamless Experience",
                      style: TextStyle(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ),
            if (state is LoginLoadingState)
              const Center(child: CircularProgressIndicator()),
          ],
        );
      }),
    );
  }
}
