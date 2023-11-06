import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_conatiner/features/add/domain/entity/gallery_entity.dart';

class AddGalleryViewModel extends StateNotifier<File?> {
  final ImagePicker _imagePicker = ImagePicker();
  String content = '';

  AddGalleryViewModel() : super(null);

  bool get isSelectedFileEmpty => state == null;

  Future<void> selectImage() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      state = File(file.path);
    }
  }

  GalleryEntity createGalleryEntity() {
    return GalleryEntity(content: content, file: state!);
  }
}

late final addGalleryViewModeProvider;
