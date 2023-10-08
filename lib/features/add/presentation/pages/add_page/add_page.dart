import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';
import 'package:memory_conatiner/features/add/presentation/widgets/submit_button.dart';

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
        actions: [
          Consumer(
            builder: (context, ref, child) => SubmitButton(
              onPressed: () => _onPressed(context, ref),
            ),
          )
        ],
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

  void _onPressed(BuildContext context, WidgetRef ref) {
    ref.read<AddViewModel>(addViewModelProvider).onSubmit().then(
          (value) => context.pop(),
        );
  }
}
