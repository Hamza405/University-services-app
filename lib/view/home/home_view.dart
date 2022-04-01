import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/auth_controller.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/shared/widgets/bottomnavbar.dart';
import 'package:university_services_app/view/home/profile_view.dart';

import 'ads_view.dart';
import 'orders_view.dart';

class HomeView extends StatefulWidget {
  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final authController = Get.find<AuthController>();
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Get.put(HomeController());
  }

  final views = <Widget>[AdsView(), OrderView(), ProfileView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: Drawer(),
          bottomNavigationBar: const BottomNavbar(),
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
          body: Obx(() => views[controller.tabIndex.value])),
    );
  }
}
