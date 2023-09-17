import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

abstract class MemoryRepository {
  Future<void> add(String date, MemoryEntity value);
}
