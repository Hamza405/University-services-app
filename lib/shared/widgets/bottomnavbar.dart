import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controller/home_controller.dart';

class BottomNavbar extends GetView<HomeController> {
  const BottomNavbar({Key? key}) : super(key: key);
  final color = Colors.purple;
  @override
  Widget build(BuildContext context) {
    return Obx(() => MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
        child: Container(
          width: double.infinity,
          height: 65,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.vertical(top: Radius.circular(16.0)),
              gradient: LinearGradient(
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
                colors: [Colors.purple, Colors.pinkAccent],
              )),
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: Colors.transparent,
            type: BottomNavigationBarType.fixed,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            // unselectedLabelStyle: unselectedLabelStyle,
            // selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.ads_click_rounded,
                    size: 20.0,
                  ),
                ),
                label: 'أخر الأعلانات',
                backgroundColor: color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: const EdgeInsets.only(bottom: 7),
                  child: const Icon(
                    Icons.document_scanner_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'طلباتي',
                backgroundColor: color,
              )
            ],
          ),
        )));
  }
}
