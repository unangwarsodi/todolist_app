import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:todo_list_app/constants/route_name.dart';

import '../utils/api.dart';
import '../utils/instance_pref.dart';

class RegisterController extends GetxController {
  final TextEditingController emailController = TextEditingController();
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

      Api().register(
        email: emailController.text,
        username: usernameController.text,
        password: passwordController.text
      ).then((value) async {
        Get.offAndToNamed(RouteName.login);
      })
      .whenComplete(() => isLoading = false);
    }
  }
}