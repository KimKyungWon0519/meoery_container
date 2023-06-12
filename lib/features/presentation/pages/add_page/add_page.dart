import 'package:flutter/material.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 추가'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(10),
        child: Placeholder(),
      ),
    );
  }
}
