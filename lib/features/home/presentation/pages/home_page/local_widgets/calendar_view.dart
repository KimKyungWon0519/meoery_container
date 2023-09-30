import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';

class CalendarView extends ConsumerWidget {
  const CalendarView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CalendarDatePicker(
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2300),
      onDateChanged: (value) => _onDateChanged(value, ref),
    );
  }

  void _onDateChanged(DateTime date, WidgetRef ref) {
    ref.read<HomeViewModel>(homeViewModelProvider.notifier).updateDate(date);
  }
}
