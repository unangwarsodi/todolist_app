import 'package:todo_list_app/utils/json.dart';

import 'item.dart';

class Checklist {
  int id;
  String name;
  List<Item> items;
  bool checklistCompletionStatus;

  Checklist({
    required this.id,
    required this.name,
    this.items = const [],
    required this.checklistCompletionStatus,
  });

  factory Checklist.fromJson(Map<dynamic, dynamic> json) {
    return Checklist(
        id: json['id'] ?? 0,
        name: json['name'] ?? '',
        checklistCompletionStatus: json['checklistCompletionStatus'] ?? false,
        items: parseListFromList<Item>(json['items'])
    );
  }

  Map get toJson => {
    'id': id,
    'name': name,
    'checklistCompletionStatus': checklistCompletionStatus,
    'items': items.map((e) => e.toJson).toList()
  };

  @override
  String toString() {
    return toJson.toString();
  }
}