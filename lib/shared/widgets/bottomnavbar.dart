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
        child: SizedBox(
          height: 65,
          child: BottomNavigationBar(
            showUnselectedLabels: true,
            showSelectedLabels: true,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: color,
            unselectedItemColor: Colors.white.withOpacity(0.5),
            selectedItemColor: Colors.white,
            // unselectedLabelStyle: unselectedLabelStyle,
            // selectedLabelStyle: selectedLabelStyle,
            items: [
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.ads_click_outlined,
                    size: 20.0,
                  ),
                ),
                label: 'أخر الأعلانات',
                backgroundColor: color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.border_outer_sharp,
                    size: 20.0,
                  ),
                ),
                label: 'طلباتي',
                backgroundColor: color,
              ),
              BottomNavigationBarItem(
                icon: Container(
                  margin: EdgeInsets.only(bottom: 7),
                  child: Icon(
                    Icons.person,
                    size: 20.0,
                  ),
                ),
                label: 'حسابي',
                backgroundColor: color,
              ),
            ],
          ),
        )));
  }
}
