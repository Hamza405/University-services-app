import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';

import '../../controller/auth_controller.dart';
import '../../controller/marks_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => Dio());
    Get.lazyPut(() => HomeController());
    Get.lazyPut(() => MarksController());
  }
}
