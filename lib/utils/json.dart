import '../models/checklist.dart';
import '../models/item.dart';

List<T> parseListFromMap<T>(Map map, String key, [List<T> defVal = const []]) {
  if (!map.containsKey(key)) return defVal;

  if (map[key] is List<Map> || map[key] is List<dynamic>) {
    return parseListFromList(map[key], defVal);
  } else if (map[key] is List<T>) {
    return map[key];
  }

  return defVal;
}

List<T> parseListFromList<T>(dynamic list, [List<T> defVal = const []]) {
  if (list == null) return defVal;
  if (list is! List) return defVal;

  switch(T) {
    case Checklist:
      return list.map<T>((dynamic x) => Checklist.fromJson(x) as T).toList();
    case Item:
      return list.map<T>((dynamic x) => Item.fromJson(x) as T).toList();
    default:
      return list as List<T>;
  }
}