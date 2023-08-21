import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';

class TitleField extends ConsumerWidget {
  const TitleField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextField(
      style: Theme.of(context).textTheme.bodyLarge,
      decoration: const InputDecoration(
        hintText: '기억 이름',
        border: InputBorder.none,
      ),
      onChanged: (value) => ref.read(addViewModelProvider).title = value,
    );
  }
}
