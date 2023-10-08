import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class AddGalleryViewModel extends StateNotifier<File?> {
  final ImagePicker _imagePicker = ImagePicker();
  String content = '';

  AddGalleryViewModel() : super(null);

  Future<void> selectImage() async {
    XFile? file = await _imagePicker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      state = File(file.path);
    }
  }
}

late final addGalleryViewModeProvider;
