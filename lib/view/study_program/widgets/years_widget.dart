import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';

import '../../../shared/constance.dart';

class YearsWidget extends GetView<HomeController> {
  const YearsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Obx(() => Column(
            children: [
              buildStudyField(
                  'السنة الأولى', controller.selectedDay.value.year1),
              const SizedBox(height: 32.0),
              buildStudyField(
                  'السنة الثانية', controller.selectedDay.value.year2),
              const SizedBox(height: 32.0),
              buildStudyField(
                  'السنة الثالثة', controller.selectedDay.value.year3),
              const SizedBox(height: 32.0),
              buildStudyField(
                  'السنة الرابعة', controller.selectedDay.value.year4),
              const SizedBox(height: 32.0),
              buildStudyField(
                  'السنة الخامسة', controller.selectedDay.value.year5),
            ],
          )),
    );
  }

  Widget buildStudyField(year, content) => Row(
        children: [
          Text(
            year.toString() + ' : ',
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
          Text(
            content.toString(),
            style: const TextStyle(
              fontSize: 18,
            ),
          ),
        ],
      );
}