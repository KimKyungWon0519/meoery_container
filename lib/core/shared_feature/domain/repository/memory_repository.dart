import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

abstract class MemoryRepository {
  Future<void> add(String date, MemoryEntity value);
  Future<List<MemoryEntity>> get(String date);
  Future<void> delete(String date, int index);
}
