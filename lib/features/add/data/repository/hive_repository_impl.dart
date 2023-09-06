import 'package:memory_conatiner/features/add/data/data_source/hive_client.dart';
import 'package:memory_conatiner/features/add/domain/repository/hive_repository.dart';

class HiveRepositoryImpl implements HiveRepository {
  final HiveClient _hiveClient;

  const HiveRepositoryImpl({required HiveClient hiveClient})
      : _hiveClient = hiveClient;

  @override
  Future<void> save(String key, Map<String, dynamic> value) async {
    _hiveClient.save(key, value);
  }
}
