import 'package:get/get.dart';

import '../models/checklist.dart';
import '../models/item.dart';
import '../utils/api.dart';

class ChecklistDetailController extends GetxController {
  final List<Item> itemsList = [];

  late Checklist checklist;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  set isLoading(bool value) {
    _isLoading = value;
    update();
  }

  @override
  void onInit() {
    checklist = (Get.arguments as List).first;

    super.onInit();
  }

  @override
  void onReady() {
    fetchData();

    super.onReady();
  }

  void fetchFirstPage() {
    itemsList.clear();

    fetchData();
  }

  void fetchData() {
    isLoading = true;

    Api().fetchChecklistItemAll(checklist.id)
    .then((items) {
      itemsList.assignAll(items);
    })
    .whenComplete(() => isLoading = false);
  }

  void deleteItemOnPressed(int id) {
    isLoading = true;

    Api().deleteChecklistItem(
      checklistId: checklist.id,
      itemId: id,
    )
    .then((items) {
      itemsList.removeWhere((element) => element.id == id);
    })
    .whenComplete(() => isLoading = false);
  }
}