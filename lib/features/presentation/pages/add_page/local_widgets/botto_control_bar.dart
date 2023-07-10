import 'package:flutter/material.dart';

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.photo),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text('완료'),
          ),
        ],
      ),
    );
  }
}
