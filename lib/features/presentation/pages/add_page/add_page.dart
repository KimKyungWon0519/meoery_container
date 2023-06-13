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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Form(
              child: TextFormField(
                style: Theme.of(context).textTheme.bodyLarge,
                decoration: const InputDecoration(
                  hintText: '제목',
                  border: InputBorder.none,
                ),
              ),
            ),
            Text(DateTime.now().toString().split(' ')[0]),
            const SizedBox(height: 20),
            Expanded(
              child: TextField(
                style: Theme.of(context).textTheme.bodyMedium,
                expands: true,
                decoration: const InputDecoration(
                  hintText: '내용',
                  border: InputBorder.none,
                ),
                maxLines: null,
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.photo),
            ),
            const Spacer(),
            TextButton(
              onPressed: () {},
              child: Text('완료'),
            ),
          ],
        ),
      ),
    );
  }
}
