import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';

import '../../../shared/constance.dart';

class DaysWidget extends GetView<HomeController> {
  const DaysWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Obx(() => Wrap(
            alignment: WrapAlignment.end,
            spacing: 8.0,
            runSpacing: 8.0,
            children: controller.studyProgram
                .map(
                  (element) => GestureDetector(
                    onTap: () => controller.selectedDay(element),
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.3,
                      decoration: BoxDecoration(
                          border: Border.all(
                              width: 2,
                              color: controller.selectedDay.value == element
                                  ? primaryColor
                                  : Colors.grey),
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          element.day!,
                          style: TextStyle(
                              fontSize: 18,
                              color: controller.selectedDay.value == element
                                  ? primaryColor
                                  : null),
                        ),
                      )),
                    ),
                  ),
                )
                .toList(),
          )),
    );
  }
}
