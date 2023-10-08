import 'dart:io';

class GalleryEntity {
  final String content;
  final File file;

  const GalleryEntity({
    required this.content,
    required this.file,
  });

  GalleryEntity copyWith({String? content, File? file}) {
    return GalleryEntity(
      content: content ?? this.content,
      file: file ?? this.file,
    );
  }
}
