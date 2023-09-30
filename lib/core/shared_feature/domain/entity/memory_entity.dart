import 'package:equatable/equatable.dart';

class MemoryEntity extends Equatable {
  final int key;
  final String title;
  final String content;
  final String date;

  const MemoryEntity({
    this.key = -1,
    this.title = '',
    this.content = '',
    this.date = '',
  });

  MemoryEntity copyWith({
    String? title,
    String? content,
    String? date,
  }) {
    return MemoryEntity(
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  @override
  List<Object?> get props => [key];
}
