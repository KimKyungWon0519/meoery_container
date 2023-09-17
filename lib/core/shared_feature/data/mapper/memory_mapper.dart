import 'package:memory_conatiner/features/add/domain/entity/memory_entity.dart';

extension MemoryMapper on MemoryEntity {
  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'content': content,
      'date': date,
    };
  }
}
