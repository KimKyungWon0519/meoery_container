import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

class MemoryListView extends ConsumerWidget {
  const MemoryListView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MemoryEntity> memories = ref.watch(homeViewModelProvider);

    return Expanded(
      child: ListView.builder(
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text(memories[index].title),
            ),
          );
        },
        itemCount: memories.length,
      ),
    );
  }
}
