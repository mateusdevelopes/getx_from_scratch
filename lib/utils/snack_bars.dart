import 'package:flutter/material.dart';
import 'package:get/instance_manager.dart';
import 'package:get/route_manager.dart';

class SnackBars {
  static void errorSnackbar(
      {required String? msg,
      Duration? duration = const Duration(seconds: 15)}) {
    return Get.snackbar("Erro", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.red[400],
        duration: duration,
        onTap: (snack) => Get.back(),
        colorText: Colors.white);
  }

  static void successSnackbar({required String? msg, Duration? duration}) {
    return Get.snackbar("Sucesso", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.green[400],
        duration: duration,
        onTap: (snack) => Get.back(),
        colorText: Colors.white);
  }

  static void wanningSnackbar({required String? msg, Duration? duration}) {
    return Get.snackbar("Aviso", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.yellow[400],
        duration: duration,
        onTap: (snack) => Get.back(),
        colorText: Colors.black);
  }

  static void infoSnackbar({required String? msg, Duration? duration}) {
    return Get.snackbar("Atenção", '$msg',
        snackPosition: SnackPosition.TOP,
        backgroundColor: Colors.blue[400],
        duration: duration,
        onTap: (snack) => Get.back(),
        colorText: Colors.white);
  }
}
