import 'package:hive/hive.dart';

class HiveClient {
  late final Box _box;

  Future<void> initialize(String name) async {
    _box = await Hive.openBox(name);
  }

  Future<void> save(String key, dynamic value) async {
    await _box.put(key, value);
  }

  Future<dynamic> get(String key) async {
    return await _box.get(key);
  }
}
