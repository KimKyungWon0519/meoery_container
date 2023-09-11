import 'package:memory_conatiner/features/add/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/add/domain/repository/memory_repository.dart';

class Save {
  final MemoryRepository _hiveRepository;

  const Save({
    required MemoryRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> save(String key, MemoryEntity value) async {
    _hiveRepository.add(key, value);
  }
}
