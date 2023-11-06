import 'package:flutter/material.dart';

import 'local_widgets/apply_button.dart';
import 'local_widgets/comment_field.dart';
import 'local_widgets/image_panel.dart';

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
      appBar: AppBar(
        title: const Text('갤러리 추가'),
        actions: const [ApplyButton()],
      ),
      body: ScrollConfiguration(
        behavior: NoBehavior(),
        child: SingleChildScrollView(
          child: Container(
            height: MediaQuery.sizeOf(context).height -
                kToolbarHeight -
                MediaQuery.viewPaddingOf(context).top,
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ImagePanel(),
                  SizedBox(height: 30),
                  CommentField(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
