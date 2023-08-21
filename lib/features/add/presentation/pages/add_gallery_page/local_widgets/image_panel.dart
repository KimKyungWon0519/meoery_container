import 'dart:io';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';

class ImagePanel extends StatefulWidget {
  const ImagePanel({super.key});

  @override
  State<ImagePanel> createState() => _ImagePanelState();
}

class _ImagePanelState extends State<ImagePanel> {
  File? file;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: file == null ? Colors.grey[400] : Colors.white,
        height: (MediaQuery.of(context).size.height - kToolbarHeight) / 2,
        width: MediaQuery.of(context).size.width - 20,
        child: file == null
            ? const Icon(
                Icons.camera_alt_outlined,
                color: Colors.black,
                size: 30,
              )
            : Image.file(file!),
      ),
      onTap: () async {
        String path = await showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => const _TypeSelectionBottomSheet(),
            ) ??
            '';

        setState(() {
          file = File(path);
        });
      },
    );
  }
}

class _TypeSelectionBottomSheet extends StatelessWidget {
  const _TypeSelectionBottomSheet();

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(30),
          topRight: Radius.circular(30),
        ),
      ),
      clipBehavior: Clip.hardEdge,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const SizedBox(
            height: 15,
          ),
          ListTile(
            title: const Text('사진'),
            onTap: () async {
              XFile? file =
                  await ImagePicker().pickImage(source: ImageSource.gallery);

              if (file != null) {
                context.pop(file.path);
              }
            },
          ),
          ListTile(
            title: Text('영상'),
            onTap: () {
              ImagePicker().pickVideo(source: ImageSource.gallery);
            },
          ),
        ],
      ),
    );
  }
}
