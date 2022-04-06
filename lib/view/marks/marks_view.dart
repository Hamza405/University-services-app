import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/marks_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/shared/widgets/appbar.dart';
import 'package:university_services_app/shared/widgets/drawer.dart';
import 'package:university_services_app/shared/widgets/progress_indicator.dart';
import 'package:university_services_app/view/marks/widget/allmarks_widget.dart';
import 'package:university_services_app/view/marks/widget/onlymarks_widget.dart';

import '../../controller/home_controller.dart';

class MarksView extends StatefulWidget {
  const MarksView({Key? key}) : super(key: key);

  @override
  State<MarksView> createState() => _MarksViewState();
}

class _MarksViewState extends State<MarksView> with TickerProviderStateMixin {
  late TabController tabController;
  final controller = Get.find<MarksController>();
  final homeController = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    controller.dispose();
    Get.delete<MarksController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text('النتائج الأمتحانية'),
            bottom: TabBar(controller: tabController, tabs: const [
              Tab(
                child: Text('علاماتي'),
              ),
              Tab(
                child: Text('جميع الامتحانات'),
              ),
            ]),
          ),
          drawer: TDrawer(),
          body: SizedBox(
              width: double.infinity,
              child: Obx(
                () => controller.loading.isTrue
                    ? const TProgressIndicator()
                    : TabBarView(
                        controller: tabController,
                        children: [
                          MyMarks(marks: controller.marks),
                          Exercise(marks: controller.marks),
                        ],
                      ),
              ))),
    );
  }
}