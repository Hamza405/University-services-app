import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';

import '../../../shared/constance.dart';
import '../../../shared/widgets/action_button.dart';

class SubServicesWidget extends GetView<HomeController> {
  const SubServicesWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        CustomButton(
            title: 'إعادة عملي',
            icon: Icons.add_card_rounded,
            onPressed: () {
              Get.defaultDialog(
                  title: 'إعادة عملي',
                  content: Obx(() => Row(
                        children: [
                          Text('إختر المقرر :'),
                          SizedBox(
                            width: context.width * 0.15,
                          ),
                          Expanded(
                            child: DropdownButton<String>(
                              value: controller.selectedSubject.value.name,
                              isExpanded: true,
                              alignment: Alignment.bottomRight,
                              items: controller.subjects.map((e) {
                                return DropdownMenuItem<String>(
                                  value: e.name,
                                  child: Text(e.name.toString()),
                                );
                              }).toList(),
                              onChanged: (v) {
                                var subject = controller.subjects
                                    .firstWhere((element) => element.name == v);
                                controller.selectedSubject(subject);
                              },
                            ),
                          )
                        ],
                      )),
                  actions: [
                    TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text('تاكيد',
                            style: TextStyle(color: primaryColor))),
                    TextButton(
                      onPressed: Get.back,
                      child: const Text('إلغاء'),
                    )
                  ]);
            }),
        CustomButton(
            title: 'رفع شكوى',
            icon: Icons.comment,
            onPressed: () {
              Get.defaultDialog(
                  title: 'رفع شكوى',
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      SizedBox(
                        height: 150,
                        child: TextField(
                          decoration: InputDecoration(
                              labelText: 'الشكوى',
                              hintText: 'أدخل محتوى الشكوى'),
                        ),
                      ),
                    ],
                  ));
            })
      ],
    );
  }
}
