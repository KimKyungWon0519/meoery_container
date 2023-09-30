import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/domain/usecase/memory_usecase.dart';

class HomeViewModel extends StateNotifier<List<MemoryEntity>> {
  final Get _get;
  final Delete _delete;

  HomeViewModel({
    required Get get,
    required Delete delete,
  })  : _get = get,
        _delete = delete,
        super([]);

  void updateMemories(String date) async {
    List<MemoryEntity> memories = await _getMemoryContainers(date);

    state = memories;
  }

  Future<List<MemoryEntity>> _getMemoryContainers(String date) async {
    return _get.getAll(date);
  }
}

late final homeViewModelProvider;
