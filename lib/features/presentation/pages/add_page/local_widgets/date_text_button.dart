import 'package:flutter/material.dart';

class DateTextButton extends StatefulWidget {
  const DateTextButton({super.key});

  @override
  State<DateTextButton> createState() => _DateTextButtonState();
}

class _DateTextButtonState extends State<DateTextButton> {
  late DateTime _date;

  @override
  void initState() {
    super.initState();

    _date = DateTime.now();
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
  }

  String dateTimeToString() {
    return _date.toString().split(' ')[0];
  }
}
