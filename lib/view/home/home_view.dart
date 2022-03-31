import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/auth_controller.dart';
import 'package:university_services_app/shared/constance.dart';

class HomeView extends GetView {
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
              icon: const Icon(Icons.exit_to_app),
              onPressed: () {
                authController.logout().then((value) => value
                    ? Navigator.pushReplacementNamed(context, loginRoute)
                    : null);
              },
            ),
          ],
        ),
        body: Center(
          child: Text('Home'),
        ),
      ),
    );
  }
}
