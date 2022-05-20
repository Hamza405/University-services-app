import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:university_services_app/controller/home_controller.dart';
import 'package:university_services_app/shared/constance.dart';
import 'package:university_services_app/view/home/widget/ads_card.dart';

class AdsView extends StatefulWidget {
  @override
  State<AdsView> createState() => _AdsViewState();
}

class _AdsViewState extends State<AdsView> {
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      displacement: 250,
      color: primaryColor,
      strokeWidth: 3,
      onRefresh: () async {
        await controller.getAds();
      },
      child: Obx(
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
      ),
    );
  }
}
