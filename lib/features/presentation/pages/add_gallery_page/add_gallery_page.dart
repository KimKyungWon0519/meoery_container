import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NoBehavior extends ScrollBehavior {
  @override
  Widget buildOverscrollIndicator(
      BuildContext context, Widget child, ScrollableDetails details) {
    return child;
  }
}

class AddGalleryPage extends StatelessWidget {
  const AddGalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ScrollConfiguration(
        behavior: NoBehavior(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height -
                kToolbarHeight -
                MediaQuery.viewPaddingOf(context).top,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const ImagePanel(),
                  const SizedBox(
                    height: 30,
                  ),
                  TextFormField(
                    style: Theme.of(context).textTheme.bodyMedium,
                    decoration: const InputDecoration(
                      hintText: '내용',
                      border: InputBorder.none,
                    ),
                    maxLength: 150,
                    maxLines: 4,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ImagePanel extends StatelessWidget {
  const ImagePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        color: Colors.grey[400],
        height: (MediaQuery.of(context).size.height - kToolbarHeight) / 2,
        width: MediaQuery.of(context).size.width - 20,
        child: const Icon(
          Icons.camera_alt_outlined,
          color: Colors.black,
          size: 30,
        ),
      ),
      onTap: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (context) => Container(
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
                  onTap: () {
                    ImagePicker().pickImage(source: ImageSource.gallery);
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
          ),
        );
      },
    );
  }
}
