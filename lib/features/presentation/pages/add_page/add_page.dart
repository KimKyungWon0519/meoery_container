import 'package:flutter/material.dart';

import 'local_widgets/botto_control_bar.dart';
import 'local_widgets/content_field.dart';
import 'local_widgets/date_text_button.dart';
import 'local_widgets/title_field.dart';

class AddPage extends StatelessWidget {
  const AddPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('기억 추가'),
      ),
      body: const Padding(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TitleField(),
            DateTextButton(),
            SizedBox(height: 20),
            ContentField(),
          ],
        ),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: const BottomControlBar(),
      ),
    );
  }
}
