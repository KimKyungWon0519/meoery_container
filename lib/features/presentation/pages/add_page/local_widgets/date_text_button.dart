import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/features/presentation/presenter/add_view_model.dart';

class DateTextButton extends ConsumerStatefulWidget {
  const DateTextButton({super.key});

  @override
  ConsumerState<DateTextButton> createState() => _DateTextButtonState();
}

class _DateTextButtonState extends ConsumerState<DateTextButton> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = DateTime.now();

    ref.read(addViewModelProvider).date = dateTimeToString();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(dateTimeToString()),
      onTap: () => _onTap(),
    );
  }

  void _onTap() async {
    DateTime? date = await showDatePicker(
          context: context,
          initialDate: _date,
          firstDate: DateTime(1900),
          lastDate: DateTime(2300),
        ) ??
        _date;

    setState(() {
      _date = date;
    });

    ref.read(addViewModelProvider).date = dateTimeToString();
  }

  String dateTimeToString() {
    return _date.toString().split(' ')[0];
  }
}
