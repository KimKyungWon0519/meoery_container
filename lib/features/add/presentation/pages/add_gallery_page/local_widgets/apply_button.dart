import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_gallery_view_model.dart';
import 'package:memory_conatiner/features/add/presentation/widgets/submit_button.dart';

class ApplyButton extends ConsumerWidget {
  const ApplyButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SubmitButton(onPressed: () => _onPressed(context, ref));
  }

  void _onPressed(BuildContext context, WidgetRef ref) {
    AddGalleryViewModel addGalleryViewModel =
        ref.read(addGalleryViewModeProvider.notifier);

    if (addGalleryViewModel.isSelectedFileEmpty) {
      _showEmptyDialog(context);
      return;
    }

    context.pop(addGalleryViewModel.createGalleryEntity());
  }

  void _showEmptyDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text('파일을 선택 후 다시 시도해주세요'),
        actions: [
          TextButton(
            onPressed: () => context.pop(),
            child: const Text('확인'),
          ),
        ],
      ),
    );
  }
}
