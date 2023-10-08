import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_gallery_view_model.dart';

class CommentField extends ConsumerWidget {
  const CommentField({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextFormField(
      onChanged: (value) =>
          ref.read(addGalleryViewModeProvider.notifier).content = value,
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
