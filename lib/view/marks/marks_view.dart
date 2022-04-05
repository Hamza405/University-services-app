import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/marks_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/shared/widgets/appbar.dart';
import 'package:university_services_app/shared/widgets/drawer.dart';

import '../../controller/home_controller.dart';

class MarksView extends StatefulWidget {
  const MarksView({Key? key}) : super(key: key);

  @override
  State<MarksView> createState() => _MarksViewState();
}

class _MarksViewState extends State<MarksView> with TickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.find<MarksController>();

  @override
  void initState() {
    super.initState();
    Get.put(HomeController());
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text('علاماتي'),
          bottom: TabBar(controller: tabController, tabs: const [
            Tab(
              child: Text('جميع الامتحانات'),
            ),
            Tab(
              child: Text('جميع الامتحانات'),
            ),
          ]),
        ),
        drawer: TDrawer(),
        body: Column(
          children: [],
        ),
      ),
    );
  }
}
