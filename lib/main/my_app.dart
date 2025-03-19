import 'package:thanima_admin/core/routes/router.dart';
import 'package:thanima_admin/features/auth/ui/pages/auth_page.dart';
import 'package:thanima_admin/main/global_blocs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:theme/theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: globalBlocs,
      child: ScreenUtilInit(
        designSize: const Size(1262, 774),
        builder: (context, _) => MaterialApp(
          debugShowCheckedModeBanner: false,
          // theme: getTheme(),
          theme: ThemeData(
            fontFamily: 'Lexend',
            // textTheme: AppTextTheme.lightTextTheme,
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
              selectedItemColor: Colors.blue,
              unselectedItemColor: Colors.grey,
              backgroundColor: Colors.white,
            ),
          ),
          title: 'Thanima Admin',
          // navigatorKey: serviceLocator<NavigationService>().getGlobalKey(),
          // navigatorObservers: [
          //   MyRouteObserver(),
          //   serviceLocator<EventsAnalytics>().getFirebaseObserver(),
          // ],
          initialRoute: Routes.loginScreenRoute,
          onGenerateRoute: Routes.generateRoute,
          home: const AuthScreen(),
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
      ),
    );
  }
}
