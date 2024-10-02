import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constants/route_name.dart';
import '../utils/api.dart';
import '../utils/instance_pref.dart';

class LoginController extends GetxController {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  void onPressed() {
    if (usernameController.text.isNotEmpty && passwordController.text.isNotEmpty) {
      isLoading = true;

      Api().login(
        username: usernameController.text,
        password: passwordController.text
      ).then((value) async {
        await InstancePref.setToken(value);

        Get.offAllNamed(RouteName.home);
      })
      .whenComplete(() => isLoading = false);
    }
  }

  void onTapRegister() {
    Get.toNamed(RouteName.register);
  }
}