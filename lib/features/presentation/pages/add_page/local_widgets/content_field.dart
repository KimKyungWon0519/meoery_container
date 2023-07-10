import 'package:flutter/material.dart';

class ContentField extends StatelessWidget {
  const ContentField({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: TextField(
        style: Theme.of(context).textTheme.bodyMedium,
        expands: true,
        decoration: const InputDecoration(
          hintText: '기억 내용',
          border: InputBorder.none,
        ),
        maxLines: null,
      ),
    );
  }
}
