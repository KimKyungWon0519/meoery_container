import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/gallery_entity.dart';

class AddGalleryViewModel extends StateNotifier<GalleryEntity> {
  final ImagePicker _imagePicker = ImagePicker();

  AddGalleryViewModel() : super(GalleryEntity.empty());

  bool get isSelectedFileEmpty => state.isFileEmpty;
  set content(String value) => state = state.copyWith(content: value);

  Future<void> selectImage() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      state = state.copyWith(file: File(file.path));
    }
  }
}

late final addGalleryViewModeProvider;
