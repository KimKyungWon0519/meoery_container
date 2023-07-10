import 'package:flutter/material.dart';

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
        onPressed: () {
          // Todo: Push Add Page
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
