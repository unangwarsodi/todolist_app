import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/route_name.dart';
import '../utils/api.dart';
import '../utils/instance_pref.dart';
import 'home_controller.dart';

class AddChecklistController extends GetxController {
  final TextEditingController nameController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  void onPressed() {
    if (nameController.text.isNotEmpty) {
      isLoading = true;

      Api().createChecklist(
        name: nameController.text,
      ).then((value) async {
        Get.find<HomeController>().fetchData();

        Get.back();
      })
      .whenComplete(() => isLoading = false);
    }
  }

  void onTapRegister() {
    Get.toNamed(RouteName.register);
  }
}