import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/view/auth/signup_view.dart';

import 'controller/auth_controller.dart';
import 'shared/utils/binding.dart';
import 'view/auth/login_view.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Get.put(AuthController());

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<NavigatorState>();
    final auth = Get.find<AuthController>();
    QOverlay.navigationKey = key;
    return GetMaterialApp(
      navigatorKey: key,
      initialBinding: Binding(),
      debugShowCheckedModeBanner: false,
      textDirection: TextDirection.rtl,
      theme: ThemeData(
        primarySwatch: primaryColor,
      ),
      initialRoute: auth.isAuth.isTrue ? homeRoute : loginRoute,
      routes: {
        loginRoute: (context) => LoginView(),
        signupRoute: (context) => SignupView(),
      },
    );
  }
}
