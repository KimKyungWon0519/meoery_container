import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';
import 'package:go_router/go_router.dart';

class MemoryItem extends ConsumerWidget {
  final MemoryEntity memory;

  const MemoryItem({
    super.key,
    required this.memory,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    HomeViewModel homeViewModel =
        ref.read<HomeViewModel>(homeViewModelProvider.notifier);

    return Dismissible(
      key: UniqueKey(),
      child: Card(
        child: ListTile(
          title: Text(memory.title),
          onTap: () => _onTap(context),
        ),
      ),
      onDismissed: (direction) => _onDismissed(homeViewModel),
    );
  }

  void _onDismissed(HomeViewModel homeViewModel) {
    homeViewModel
        .deleteMemory(memory)
        .then((value) => homeViewModel.updateMemories());
  }

  void _onTap(BuildContext context) => context.pushNamed(
        AppRoutes.view.name,
        extra: memory,
      );
}
