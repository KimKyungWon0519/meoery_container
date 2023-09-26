import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<MemoryEntity> memories = ref.watch(homeViewModelProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 창고'),
      ),
      body: Column(
        children: [
          CalendarDatePicker(
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime(2300),
            onDateChanged: (value) {},
          ),
          Expanded(
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
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _addMemoryEvent(context, ref),
        child: const Icon(Icons.add),
      ),
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
