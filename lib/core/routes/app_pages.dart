import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/features/presentation/pages/home_page/home_page.dart';

abstract class AppPages {
  const AppPages._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      )
    ],
    initialLocation: AppRoutes.home,
  );
}
