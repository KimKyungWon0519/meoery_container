import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

final _memoryContainer = FutureProvider.family.autoDispose(
  (ref, String date) =>
      ref.read<HomeViewModel>(homeViewModelProvider).getMemoryContainers(date),
);

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeViewModel =
        ref.watch(_memoryContainer(DateTime.now().toString().split(' ')[0]));

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
            child: homeViewModel.when(
              data: (data) {
                return ListView.builder(
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text(data[index].title),
                      ),
                    );
                  },
                  itemCount: data.length,
                );
              },
              error: (error, stack) => Container(),
              loading: () => const Center(
                child: CircularProgressIndicator(),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.pushNamed(AppRoutes.addMemory.name),
        child: const Icon(Icons.add),
      ),
    );
  }
}
