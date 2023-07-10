import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';

class BottomControlBar extends StatelessWidget {
  const BottomControlBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        children: [
          IconButton(
            onPressed: () => context.push(AppRoutes.gallery),
            icon: const Icon(Icons.photo),
          ),
          const Spacer(),
          TextButton(
            onPressed: () {},
            child: const Text('완료'),
          ),
        ],
      ),
    );
  }
}
