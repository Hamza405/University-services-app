import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:q_overlay/q_overlay.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/shared/widgets/action_button.dart';
import 'package:university_services_app/view/home/widget/sub_services_widget.dart';

import '../../controller/home_controller.dart';

class OrderView extends GetView<HomeController> {
  const OrderView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Obx(() => controller.loading.isTrue
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 8.0),
                    child: Row(
                      children: [
                        const Text(
                          'الطلبات المتاحة لك :',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.normal),
                        ),
                        SizedBox(
                          width: size.width * 0.2,
                        ),
                        Expanded(
                          child: DropdownButton<String>(
                            isExpanded: true,
                            alignment: Alignment.bottomRight,
                            items: controller.services.map((e) {
                              return DropdownMenuItem<String>(
                                value: e.serviceName,
                                child: Text(e.serviceName.toString()),
                              );
                            }).toList(),
                            value: controller.selectedService().serviceName,
                            onChanged: (v) {
                              var service = controller.services.firstWhere(
                                  (element) => element.serviceName == v);
                              controller.selectedService(service);
                              Get.defaultDialog(
                                  title: 'تقديم طلب',
                                  middleText: 'هل تريد تقديم طلب $v',
                                  actions: [
                                    TextButton(
                                        onPressed: () {
                                          controller.addOrder(controller
                                              .selectedService.value.id);
                                          Get.back();
                                        },
                                        child: const Text('تاكيد',
                                            style: TextStyle(
                                                color: primaryColor))),
                                    TextButton(
                                      onPressed: Get.back,
                                      child: const Text('إلغاء'),
                                    )
                                  ]);
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  if (controller.loading()) const LinearProgressIndicator(),
                  const SizedBox(
                    height: 5,
                  ),
                  const SubServicesWidget(),
                  const Divider(),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    child: Text(
                      'طلباتي',
                      style: TextStyle(fontSize: 30, color: primaryColor),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  ...controller.myOrder.map((e) {
                    var name = controller.services
                        .firstWhere(
                            (element) => element.id.toString() == e.serviceId)
                        .serviceName;
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              title: Row(
                                children: [
                                  Expanded(flex: 2, child: Text(name!)),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      flex: 2,
                                      child: e.state == 0
                                          ? Text('قيد الانتظار')
                                          : Text('مكتمل')),
                                ],
                              ),
                              trailing: Icon(
                                e.state == 0 ? Icons.watch_later : Icons.check,
                                color: e.state == 0
                                    ? Colors.orangeAccent
                                    : Colors.green,
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                  const SizedBox(height: 5),
                  const Divider(),
                  ...controller.myReOrder.map((e) {
                    var name = controller.subjects
                        .firstWhere(
                            (element) => element.id.toString() == e.subjectId)
                        .name;
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 8.0),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          child: Card(
                            child: ListTile(
                              contentPadding:
                                  const EdgeInsets.symmetric(horizontal: 25.0),
                              title: Row(
                                children: [
                                  Expanded(flex: 2, child: Text(name!)),
                                  const SizedBox(width: 10),
                                  Expanded(
                                      flex: 2,
                                      child: Text(e.created_at!
                                          .toIso8601String()
                                          .split('T')
                                          .first)),
                                ],
                              ),
                              trailing: IconButton(
                                icon: const Icon(
                                  Icons.restart_alt_sharp,
                                  color: Colors.red,
                                ),
                                onPressed: () => controller.pullReOrder(e.id!),
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                ]),
          ));
  }
}
