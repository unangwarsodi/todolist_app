import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../models/checklist.dart';
import '../utils/api.dart';
import '../utils/instance_pref.dart';

class HomeController extends GetxController {
  final List<Checklist> checklist = [];

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onReady() {
    fetchData();

    super.onReady();
  }

  void fetchFirstPage() {
    checklist.clear();

    fetchData();
  }

  void fetchData() {
    isLoading = true;

    Api().fetchChecklistAll()
    .then((items) {
      checklist.addAll(items);
    })
    .whenComplete(() => isLoading = false);
  }

  void deleteOnPressed(int id) {
    isLoading = true;

    Api().deleteChecklist(id)
      .then((items) {
      checklist.removeWhere((element) => element.id == id);
    })
    .whenComplete(() => isLoading = false);
  }
}