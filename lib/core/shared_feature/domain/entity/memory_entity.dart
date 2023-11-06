import 'package:equatable/equatable.dart';
import 'package:memory_conatiner/features/add/domain/entity/gallery_entity.dart';

class MemoryEntity extends Equatable {
  final int key;
  final String title;
  final String content;
  final String date;
  final List<GalleryEntity> galleries;

  const MemoryEntity({
    this.key = -1,
    this.title = '',
    this.content = '',
    this.date = '',
    this.galleries = const [],
  });

  MemoryEntity copyWith({
    int? key,
    String? title,
    String? content,
    String? date,
    List<GalleryEntity>? galleries,
  }) {
    return MemoryEntity(
      key: key ?? this.key,
      title: title ?? this.title,
      content: content ?? this.content,
      date: date ?? this.date,
      galleries: galleries ?? this.galleries,
    );
  }

  @override
  List<Object?> get props => [key];
}
