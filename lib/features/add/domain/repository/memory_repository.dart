import 'package:memory_conatiner/features/add/domain/entity/memory_entity.dart';

abstract class MemoryRepository {
  Future<void> add(String date, MemoryEntity value);
}
