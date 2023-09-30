import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/home/presentation/pages/home_page/local_widgets/calendar_view.dart';
import 'package:memory_conatiner/features/home/presentation/pages/home_page/local_widgets/memory_listview.dart';

import 'local_widgets/add_fab.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 창고'),
      ),
      body: const Column(
        children: [
          CalendarView(),
          MemoryListView(),
        ],
      ),
      floatingActionButton: const AddFAB(),
    );
  }
}
