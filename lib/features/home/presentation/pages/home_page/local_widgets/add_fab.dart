import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

class AddFAB extends ConsumerWidget {
  const AddFAB({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return FloatingActionButton(
      onPressed: () => _addMemoryEvent(context, ref),
      child: const Icon(Icons.add),
    );
  }

  void _addMemoryEvent(BuildContext context, WidgetRef ref) {
    context.pushNamed(AppRoutes.addMemory.name).then((value) {
      ref
          .read<HomeViewModel>(homeViewModelProvider.notifier)
          .updateMemories(DateTime.now().toString().split(' ')[0]);
    });
  }
}
