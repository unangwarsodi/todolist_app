import 'package:get/get.dart';

import '../views/add_checklist.dart';
import '../views/checklist_detail.dart';
import '../views/home.dart';
import '../views/login.dart';
import '../views/register.dart';
import '../views/splash.dart';
import 'route_name.dart';

class RoutePage {
  static String initialRoute = RouteName.splash;

  static final routes = [
    GetPage(name: RouteName.splash, page: () => const Splash(), transition: Transition.noTransition),
    GetPage(name: RouteName.login, page: () => const LoginPage(), transition: Transition.noTransition),
    GetPage(name: RouteName.register, page: () => const RegisterPage(), transition: Transition.noTransition),
    GetPage(name: RouteName.home, page: () => const HomePage(), transition: Transition.noTransition),
    GetPage(name: RouteName.addChecklist, page: () => const AddChecklistPage(), transition: Transition.noTransition),
    GetPage(name: RouteName.checklistDetail, page: () => const ChecklistDetailPage(), transition: Transition.noTransition),
  ];
}