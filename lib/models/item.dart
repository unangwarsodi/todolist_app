class Item {
  int id;
  String name;
  bool itemCompletionStatus;

  Item({
    required this.id,
    required this.name,
    required this.itemCompletionStatus,
  });

  factory Item.fromJson(Map<dynamic, dynamic> json) {
    return Item(
      id: json['id'] ?? 0,
      name: json['name'] ?? '',
      itemCompletionStatus: json['itemCompletionStatus'] ?? false
    );
  }

  Map get toJson => {
    'id': id,
    'name': name,
    'itemCompletionStatus': itemCompletionStatus,
  };

  @override
  String toString() {
    return toJson.toString();
  }
}