import 'package:flutter/material.dart';
import 'package:memory_conatiner/features/presentation/pages/gallery_page/local_widgets/picture_panel.dart';

class GalleryPage extends StatelessWidget {
  const GalleryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 갤러리'),
      ),
      body: PageView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 100,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const PicturePanel(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: Icon(Icons.add),
      ),
    );
  }
}
