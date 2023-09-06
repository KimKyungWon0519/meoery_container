import 'package:hive/hive.dart';

class HiveClient {
  late final Box _box;

  Future<void> initialize(String name) async {
    _box = await Hive.openBox(name);
  }

  Future<void> save(String key, Map<String, dynamic> value) async {
    _box.put(key, value);
  }

  Future<Map<String, dynamic>> get(String key) async {
    return await _box.get(key);
  }
}
