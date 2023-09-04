import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:memory_conatiner/core/routes/app_pages.dart';
import 'package:memory_conatiner/core/values/theme.dart';

import 'dependency_injection.dart' as di;

void main() async {
  await di.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Flutter Demo',
      theme: AppTheme.getLightTheme(),
      routerConfig: AppPages.router,
    );
  }
}
