import 'package:hive/hive.dart';

class HiveClient {
  late final Box _box;

  Future<bool> initialize(String name) async {
    try {
      _box = await Hive.openBox(name);
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> save(String key, Map<String, dynamic> value) async {
    try {
      await _box.put(key, value);
      return true;
    } catch (e) {
      return false;
    }
  }
}
