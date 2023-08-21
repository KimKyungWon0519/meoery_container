import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/domain/entity/memory_entity.dart';

class AddViewModel {
  String title = '';
  String content = '';
  String date = '';

  AddViewModel() : super();

  void onSubmit() {
    MemoryEntity memoryEntity = MemoryEntity(
      title: title.isEmpty ? '새로운 기억' : title,
      content: content,
      date: date,
    );

    debugPrint('[LOG] $memoryEntity');
  }
}

final addViewModelProvider = Provider<AddViewModel>((ref) => AddViewModel());
