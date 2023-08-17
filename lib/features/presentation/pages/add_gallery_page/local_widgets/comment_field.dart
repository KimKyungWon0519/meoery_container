import 'package:flutter/material.dart';

class CommentField extends StatelessWidget {
  const CommentField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyMedium,
      decoration: const InputDecoration(
        hintText: '내용',
        border: InputBorder.none,
      ),
      maxLength: 150,
      maxLines: 4,
    );
  }
}
