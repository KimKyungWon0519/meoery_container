abstract class AppRoutes {
  const AppRoutes._();

  static pathModel home = const pathModel(
    name: 'home',
    path: '/home',
  );
  static pathModel addMemory = const pathModel(
    name: 'add_memory',
    path: '/add_memory',
  );
  static pathModel gallery = const pathModel(
    name: 'gallery',
    path: '/gallery',
  );
  static pathModel addGallery = const pathModel(
    name: 'add_gallery',
    path: 'add',
  );
}

class pathModel {
  final String name;
  final String path;

  const pathModel({required this.name, required this.path});
}
