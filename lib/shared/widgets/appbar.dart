import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';

class TAppBar extends GetView<HomeController> implements PreferredSizeWidget {
  final String title;
  const TAppBar({Key? key, this.title = 'الهمك'}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title),
      flexibleSpace: Container(
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
              ))),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
