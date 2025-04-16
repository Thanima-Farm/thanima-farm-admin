import 'dart:async';
import 'dart:io';

import 'package:thanima_admin/core/config/app_config.dart';
import 'package:thanima_admin/core/environment/environment.dart';
import 'package:thanima_admin/core/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
// import 'package:shared_preferences/shared_preferences.dart';
import 'package:thanima_admin/my_app.dart';

Future<void> applySystemSettings() async {
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitUp,
  ]);
  await SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.manual,
    overlays: SystemUiOverlay.values,
  );
}

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();
      await applySystemSettings();

      await setupServiceLocator();
      final AppConfig appConfig = locator.get<AppConfig>();
      // final SharedPreferences sharedPreferences =
      //     await SharedPreferences.getInstance();

      const String strEnv = String.fromEnvironment("env", defaultValue: "qa");
      final Environment env = Environment.from(strEnv);
      setConfig(appConfig, env);
      runApp(const MyApp());
    },
    (Object error, StackTrace stack) {
      if (!kDebugMode) {
        bool isNetworkException = false;
        try {
          if (error is HttpException ||
              error is HandshakeException ||
              error is SocketException) {
            isNetworkException = true;
          }
        } catch (e) {
          isNetworkException = false;
        }
        if (!isNetworkException) {
          // FirebaseCrashlytics.instance.recordError(error, stack);
        }
      }
      debugPrint(stack.toString());
    },
  );
}
