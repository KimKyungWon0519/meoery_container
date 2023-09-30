import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/domain/entity/container_entity.dart';
import 'package:memory_conatiner/features/home/domain/usecase/memory_usecase.dart';

class HomeViewModel extends StateNotifier<ContainerEntity> {
  final Get _get;
  final Delete _delete;

  HomeViewModel({
    required Get get,
    required Delete delete,
  })  : _get = get,
        _delete = delete,
        super(const ContainerEntity());

  void updateMemories(String date) async {
    List<MemoryEntity> memories = await _getMemoryContainers(date);

    state = state.copyWith(memories: memories);
  }

  Future<List<MemoryEntity>> _getMemoryContainers(String date) async {
    return _get.getAll(date);
  }

  Future<void> deleteMemory(MemoryEntity memory) async {
    await _delete.delete(memory.date, memory);
  }
}

late final homeViewModelProvider;
