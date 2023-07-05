import 'package:flutter/material.dart';

class PicturePanel extends StatelessWidget {
  const PicturePanel({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.network(
            'https://storage.googleapis.com/cms-storage-bucket/c823e53b3a1a7b0d36a9.png',
            height: (MediaQuery.of(context).size.height - kToolbarHeight) / 2,
            width: MediaQuery.of(context).size.width - 20,
          ),
          const SizedBox(
            height: 30,
          ),
          Text('a' * 150),
        ],
      ),
    );
  }
}
