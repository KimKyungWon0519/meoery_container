import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';

class SubmitButton extends ConsumerWidget {
  const SubmitButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return TextButton(
      onPressed: () {
        ref.read<AddViewModel>(addViewModelProvider).onSubmit().then(
              (value) => context.pop(),
            );
      },
      child: const Text('완료'),
    );
  }
}
