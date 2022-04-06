import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/auth_controller.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/shared/widgets/bottomnavbar.dart';

import '../../shared/widgets/appbar.dart';
import '../../shared/widgets/drawer.dart';
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
  }

  @override
  void dispose() {
    super.dispose();
  }

  final views = const <Widget>[AdsView(), OrderView()];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          drawer: const TDrawer(),
          bottomNavigationBar: const BottomNavbar(),
          appBar: const TAppBar(),
          body: Obx(() => views[controller.tabIndex.value])),
    );
  }
}
