import 'dart:io';

import 'package:equatable/equatable.dart';

class GalleryEntity extends Equatable {
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

  @override
  List<Object?> get props => [
        content,
        file,
      ];
}
