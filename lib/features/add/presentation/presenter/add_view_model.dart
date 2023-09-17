import 'package:flutter/foundation.dart';
import 'package:memory_conatiner/features/add/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/add/domain/usecase/hive_usecase.dart'
    as HiveUseCase;

class AddViewModel {
  final HiveUseCase.Save _saveUseCase;

  String title = '';
  String content = '';
  String date = '';

  AddViewModel({
    required HiveUseCase.Save saveUseCase,
  }) : _saveUseCase = saveUseCase;

  Future<void> onSubmit() async {
    MemoryEntity memoryEntity = MemoryEntity(
      title: title.isEmpty ? '새로운 기억' : title,
      content: content,
      date: date,
    );

    debugPrint('[LOG] $memoryEntity');

    _saveUseCase.save(date, memoryEntity);
  }
}

late final addViewModelProvider;
