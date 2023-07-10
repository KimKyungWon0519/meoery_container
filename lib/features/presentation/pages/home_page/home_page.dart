import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 창고'),
      ),
      body: CalendarDatePicker(
        initialDate: DateTime.now(),
        firstDate: DateTime(1900),
        lastDate: DateTime(2300),
        onDateChanged: (value) {},
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.push(AppRoutes.add),
        child: const Icon(Icons.add),
      ),
    );
  }
}
