import 'package:go_router/go_router.dart';
import 'package:memory_conatiner/core/routes/app_routes.dart';
import 'package:memory_conatiner/features/add/presentation/pages/add_gallery_page/add_gallery_page.dart';
import 'package:memory_conatiner/features/add/presentation/pages/add_page/add_page.dart';
import 'package:memory_conatiner/features/gallery/presentation/pages/gallery_page/gallery_page.dart';
import 'package:memory_conatiner/features/home/presentation/home_page/home_page.dart';

abstract class AppPages {
  const AppPages._();

  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        name: AppRoutes.home.name,
        path: AppRoutes.home.path,
        builder: (context, state) => const HomePage(),
      ),
      GoRoute(
        name: AppRoutes.addMemory.name,
        path: AppRoutes.addMemory.path,
        builder: (context, state) => const AddPage(),
      ),
      GoRoute(
        name: AppRoutes.gallery.name,
        path: AppRoutes.gallery.path,
        builder: (context, state) => const GalleryPage(),
        routes: [
          GoRoute(
            name: AppRoutes.addGallery.name,
            path: AppRoutes.addGallery.path,
            builder: ((context, state) => const AddGalleryPage()),
          )
        ],
      ),
    ],
    initialLocation: AppRoutes.home.path,
  );
}
