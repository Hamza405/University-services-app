import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/local_storage.dart';
import 'package:university_services_app/view/auth/login_view.dart';
import 'package:university_services_app/view/exam_program/exam_program_view.dart';
import 'package:university_services_app/view/study_program/study_program_view.dart';

import 'controller/auth_controller.dart';
import 'shared/constance.dart';
import 'shared/utils/binding.dart';
import 'view/auth/signup_view.dart';
import 'view/home/home_view.dart';
import 'view/marks/marks_view.dart';
import 'view/subjects/subjects.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final key = GlobalKey<NavigatorState>();
    QOverlay.navigationKey = key;
    final auth = Get.find<AuthController>();
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
        homeRoute: (context) {
          Get.put(HomeController());
          return HomeView();
        },
        marksRoute: (context) => const MarksView(),
        subjectsRoute: (context) => const SubjectsView(),
        studyProgramRoute: (context) => const StudyProgramView(),
        examProgramRoute: (context) => const ExamProgramView(),
      },
    );
  }
}

Future<void> initApp() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = LocalStorage();
  await sharedPreferences.init();
  Get.put(sharedPreferences);
  final _dio = Dio();
  _dio.options.baseUrl = baseURL;
  Get.put(_dio);
  final auth = AuthController();
  await auth.autoLogin();
  Get.put(auth);
}
