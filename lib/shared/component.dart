import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
