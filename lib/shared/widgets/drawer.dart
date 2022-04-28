import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/marks_controller.dart';
import 'package:university_services_app/shared/component.dart';
import 'package:university_services_app/shared/constance.dart';

import '../../controller/auth_controller.dart';

class TDrawer extends StatelessWidget {
  const TDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(
            automaticallyImplyLeading: false,
            title: const Text('كلية الهمك'),
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, homeRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('علاماتي'),
            onTap: () {
              Get.put(MarksController());
              Navigator.pushReplacementNamed(context, marksRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('المقررات الدراسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, subjectsRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('البرنامج الدراسي'),
            onTap: () {
              Navigator.pushReplacementNamed(context, studyProgramRoute);
            },
          ),
          ListTile(
            leading: const Icon(Icons.exit_to_app),
            title: const Text('تسجيل الخروج'),
            onTap: () {
              Get.find<AuthController>().logout().then((value) => value
                  ? Navigator.pushReplacementNamed(context, '/login')
                  : showErrorSnackBar('حدث خطأ أثناء تسجيل الخروج'));
            },
          ),
        ],
      ),
    );
  }
}
