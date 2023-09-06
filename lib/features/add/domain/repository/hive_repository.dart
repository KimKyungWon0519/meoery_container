abstract class HiveRepository {
  Future<void> save(String key, Map<String, dynamic> value);
}
