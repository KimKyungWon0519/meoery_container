import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/features/presentation/pages/add_page/add_page.dart';
import 'package:memory_conatiner/features/presentation/pages/gallery_page/gallery_page.dart';
import 'package:memory_conatiner/features/presentation/pages/home_page/home_page.dart';

abstract class AppPages {
  const AppPages._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutes.home,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        path: AppRoutes.add,
        builder: (context, state) => const AddPage(),
      ),
      GoRoute(
        path: AppRoutes.gallery,
        builder: (context, state) => const GalleryPage(),
      ),
    ],
    initialLocation: AppRoutes.add,
  );
}
