import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/marks_controller.dart';
import 'package:university_services_app/shared/component.dart';
import 'package:university_services_app/shared/constance.dart';

import '../../controller/auth_controller.dart';
import 'appbar.dart';

class TDrawer extends StatelessWidget {
  const TDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            height: 55,
            decoration: const BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.purple,
                    blurRadius: 10,
                    offset: Offset(0, 5),
                  ),
                ],
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.purple, Colors.pinkAccent],
                )),
            child: const Center(
                child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.0),
                child: Text(
                  'كلية الهمك',
                  style: TextStyle(fontSize: 20, color: Colors.white),
                  textAlign: TextAlign.right,
                ),
              ),
            )),
          ),
          const SizedBox(
            height: 5,
          ),
          ListTile(
            leading: const Icon(Icons.home_outlined),
            title: const Text('الرئيسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, homeRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.my_library_books_outlined),
            title: const Text('علاماتي'),
            onTap: () {
              Get.put(MarksController());
              Navigator.pushReplacementNamed(context, marksRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.edit_note),
            title: const Text('المقررات الدراسية'),
            onTap: () {
              Navigator.pushReplacementNamed(context, subjectsRoute);
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.calendar_month_outlined),
            title: const Text('البرنامج الدراسي'),
            onTap: () {
              Navigator.pushReplacementNamed(context, studyProgramRoute);
            },
          ),
          const Divider(),
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
