import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/core/utility/converter.dart';
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
        super(const ContainerEntity()) {
    updateDate(DateTime.now());
  }

  void updateDate(DateTime date) {
    state = ContainerEntity(date: dateTimeToString(date));

    updateMemories();
  }

  void updateMemories() async {
    List<MemoryEntity> memories = await _get.getAll(state.date);

    state = state.copyWith(memories: memories);
  }

  Future<void> deleteMemory(MemoryEntity memory) async {
    await _delete.delete(state.date, memory);
  }
}

late final homeViewModelProvider;
