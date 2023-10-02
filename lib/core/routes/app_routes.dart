abstract class AppRoutes {
  const AppRoutes._();

  static PathModel home = const PathModel(
    name: 'home',
    path: '/home',
  );
  static PathModel addMemory = const PathModel(
    name: 'add_memory',
    path: '/add_memory',
  );
  static PathModel gallery = const PathModel(
    name: 'gallery',
    path: '/gallery',
  );
  static PathModel addGallery = const PathModel(
    name: 'add_gallery',
    path: 'add',
  );
}

class PathModel {
  final String name;
  final String path;

  const PathModel({required this.name, required this.path});
}
