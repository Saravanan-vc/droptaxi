import 'package:flutter/material.dart';
import 'package:get/get.dart';

void customPOPmsg(String msg, Color background) {
  ScaffoldMessenger.of(Get.context!).showSnackBar(
    SnackBar(
      behavior: SnackBarBehavior.floating,
      duration: const Duration(seconds: 10),
      elevation: 0.8,
      showCloseIcon: true,
      backgroundColor: background,
      width: MediaQuery.sizeOf(Get.context!).width * 0.4,
      content: Text(msg),
    ),
    snackBarAnimationStyle: AnimationStyle(
      reverseDuration: const Duration(seconds: 1),
      reverseCurve: Curves.easeInOut,
      curve: Curves.easeIn,
      duration: const Duration(milliseconds: 800),
    ),
  );
}
