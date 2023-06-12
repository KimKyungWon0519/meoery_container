import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 추가'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: TextFormField(
            style: Theme.of(context).textTheme.bodyLarge,
            decoration: const InputDecoration(
              hintText: '제목',
              border: InputBorder.none,
            ),
          ),
        ),
      ),
    );
  }
}
