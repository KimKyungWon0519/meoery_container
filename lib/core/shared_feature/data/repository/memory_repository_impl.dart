import 'dart:convert';

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
    List<String> containers = await _hiveClient.get(date) ?? [];

    containers.add(json.encode(MemoryMapper.toJson(memoryEntity)));

    _hiveClient.save(date, containers);
  }

  @override
  Future<List<MemoryEntity>> get(String date) async {
    List<dynamic> containers = await _hiveClient.get(date) ?? [];

    return containers.map((e) {
      return MemoryMapper.fromJson(json.decode(e));
    }).toList();
  }

  @override
  Future<void> delete(String date, MemoryEntity memoryEntity) async {
    List<MemoryEntity> containers = await get(date);

    containers.remove(memoryEntity);

    _hiveClient.save(date, containers);
  }
}
