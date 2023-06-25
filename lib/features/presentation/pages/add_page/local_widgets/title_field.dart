import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: const InputDecoration(
        hintText: '기억 이름',
        border: InputBorder.none,
      ),
    );
  }
}
