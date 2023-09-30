import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/domain/entity/container_entity.dart';
import 'package:memory_conatiner/features/home/presentation/pages/home_page/local_widgets/memory_item.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MemoryEntity> memories =
        ref.watch<ContainerEntity>(homeViewModelProvider).memories;

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return MemoryItem(memory: memories[index]);
        },
        itemCount: memories.length,
      ),
    );
  }
}
