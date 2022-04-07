import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/view/home/widget/ads_card.dart';

class AdsView extends GetView<HomeController> {
  const AdsView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => controller.loading.isTrue
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children:
                    controller.ads.map((ads) => AdsCard(ads: ads)).toList(),
              ),
            ),
    );
  }
}
