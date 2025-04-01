import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:thanima_admin/core/routes/router.dart';
import 'package:thanima_admin/features/auth/cubit/auth/auth_cubit.dart';
import 'package:thanima_admin/features/auth/cubit/login/login_cubit.dart';
import 'package:thanima_admin/features/auth/ui/login_screen.dart';
import 'package:theme/theme_const.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(1262, 774),
      builder:
          (context, _) => MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: getTheme(),
            title: 'Thanima Admin',
            // navigatorKey: serviceLocator<NavigationService>().getGlobalKey(),
            // navigatorObservers: [
            //   MyRouteObserver(),
            //   serviceLocator<EventsAnalytics>().getFirebaseObserver(),
            // ],
            initialRoute: Routes.loginScreenRoute,
            onGenerateRoute: Routes.generateRoute,
            home: MultiBlocProvider(
              providers: [
                BlocProvider(create: (_) => AuthCubit()),
                BlocProvider(create: (_) => LoginCubit()),
              ],
              child: LoginScreen(),
              // create: (_) => LoginCubit(),
              // child: const LoginScreen(),
            ),
            // builder: (context, widget) {
            // Widget error = const CustomLoadingScreen(
            //   showSettingUpTxt: true,
            // );
            // if (widget is Scaffold || widget is Navigator) {
            //   error = Scaffold(body: Center(child: error));
            // }
            // ErrorWidget.builder = (errorDetails) => error;
            // if (widget != null) return widget;
            // throw ('widget is null');
            // },
          ),
    );
  }
}
