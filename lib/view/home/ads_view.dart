import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/constance.dart';

class AdsView extends GetView<HomeController> {
  const AdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Obx(() => controller.loading.isTrue
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : SingleChildScrollView(
                child: Column(
                  children: controller.ads
                      .map((e) => Padding(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 16.0, vertical: 10.0),
                            child: Card(
                              elevation: 5,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25.0),
                              ),
                              color: Colors.grey[100],
                              shadowColor: primaryColor,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      e.section.toString(),
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.grey[700]),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(e.description.toString()),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    const Divider(),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 16.0),
                                          child: Text(
                                            e.created_at!
                                                .toIso8601String()
                                                .split('T')
                                                .first,
                                            style: TextStyle(
                                                color: Colors.grey[700]),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ))
                      .toList(),
                ),
              )));
  }
}
