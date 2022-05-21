import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../model/order.dart';

void showErrorSnackBar(String message) {
  Get.snackbar('Error', message,
      messageText: Text(
        message,
        textDirection: TextDirection.ltr,
        style: const TextStyle(color: Colors.white),
      ),
      titleText: const Text(
        'Error',
        textDirection: TextDirection.ltr,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.purple.withOpacity(0.7),
      snackPosition: SnackPosition.BOTTOM);
}

void showOrderSuccess(Order order) {
  Get.defaultDialog(
      title: 'تفاصيل الطلب',
      content: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'تم تقديم طلبك بنجاح',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'عند تاريخ ${order.created_at!.toIso8601String().split('T').first}',
                style: TextStyle(fontSize: 20),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'الطلب صالح حتى تاريخ ${order.deadline!.toIso8601String().split('T').first}',
                style: TextStyle(fontSize: 15),
              ),
            ],
          ),
        ),
      ));
}

void showComplaintSuccess() {
  Get.defaultDialog(
    title: 'تقديم شكوى',
    middleText: 'تم تقديم الشكوى بنجاح',
  );
}
