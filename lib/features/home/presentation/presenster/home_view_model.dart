import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/domain/usecase/memory_usecase.dart';

class HomeViewModel {
  final Get _get;

  const HomeViewModel({
    required Get get,
  }) : _get = get;

  Future<List<MemoryEntity>> getMemoryContainers(String date) async {
    return _get.getAll(date);
  }
}

late final homeViewModelProvider;
