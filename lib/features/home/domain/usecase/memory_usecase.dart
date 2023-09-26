import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/core/shared_feature/domain/repository/memory_repository.dart';

class Get {
  final MemoryRepository _hiveRepository;

  const Get({
    required MemoryRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<List<MemoryEntity>> getAll(String date) async {
    return await _hiveRepository.get(date);
  }
}
