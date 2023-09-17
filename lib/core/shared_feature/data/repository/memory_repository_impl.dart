import 'package:memory_conatiner/core/shared_feature/data/data_source/hive_client.dart';
import 'package:memory_conatiner/core/shared_feature/data/mapper/memory_mapper.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/core/shared_feature/domain/repository/memory_repository.dart';

class MemoryRepositoryImpl implements MemoryRepository {
  final HiveClient _hiveClient;

  const MemoryRepositoryImpl({required HiveClient hiveClient})
      : _hiveClient = hiveClient;

  @override
  Future<void> add(String date, MemoryEntity memoryEntity) async {
    List<Map<String, dynamic>> containers = await _hiveClient.get(date) ?? [];

    containers.add(memoryEntity.toJson());

    _hiveClient.save(date, containers);
  }
}
