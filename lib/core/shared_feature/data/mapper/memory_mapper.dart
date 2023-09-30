import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

class MemoryMapper {
  const MemoryMapper._();

  static Map<String, dynamic> toJson(MemoryEntity entity) {
    return {
      'key': entity.key,
      'title': entity.title,
      'content': entity.content,
      'date': entity.date,
    };
  }

  static MemoryEntity fromJson(Map<String, dynamic> json) {
    return MemoryEntity(
      key: json['key'],
      title: json['title'],
      content: json['content'],
      date: json['date'],
    );
  }
}
