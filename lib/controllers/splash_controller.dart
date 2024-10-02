import 'package:get/get.dart';

import '../constants/route_name.dart';
import '../utils/instance_pref.dart';
import '../utils/shared_pref.dart';

class SplashController extends GetxController {

  @override
  void onReady() {
    SharedPref.initSharedPref()
    .then((value) {
      String token = InstancePref.getToken();

      if (token.isNotEmpty) {
        Get.offAllNamed(RouteName.home);
      } else {
        Get.toNamed(RouteName.login);
      }
    });

    super.onReady();
  }
}