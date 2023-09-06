import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
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

  void onSubmit() {
    MemoryEntity memoryEntity = MemoryEntity(
      title: title.isEmpty ? '새로운 기억' : title,
      content: content,
      date: date,
    );

    debugPrint('[LOG] $memoryEntity');
  }
}

late final addViewModelProvider;
