import 'package:flutter/material.dart';
import 'package:memory_conatiner/core/routes/app_pages.dart';
import 'package:memory_conatiner/core/values/theme.dart';

void main() {
  runApp(const MyApp());
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
