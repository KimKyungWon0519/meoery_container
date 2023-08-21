import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';

class ContentField extends ConsumerWidget {
  const ContentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Expanded(
      child: TextField(
        onChanged: (value) => ref.read(addViewModelProvider).content = value,
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
