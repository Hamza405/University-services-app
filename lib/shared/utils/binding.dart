import 'package:dio/dio.dart';
import 'package:get/get.dart';

import '../../controller/auth_controller.dart';

class Binding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AuthController());
    Get.lazyPut(() => Dio());
  }
}
