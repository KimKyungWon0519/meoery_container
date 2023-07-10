import 'package:flutter/material.dart';

class DateTextButton extends StatelessWidget {
  const DateTextButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Text(DateTime.now().toString().split(' ')[0]),
      onTap: () {
        showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(1900),
          lastDate: DateTime(2300),
        );
      },
    );
  }
}
