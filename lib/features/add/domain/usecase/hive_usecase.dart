import 'package:memory_conatiner/features/add/domain/repository/hive_repository.dart';

class Save {
  final HiveRepository _hiveRepository;

  const Save({
    required HiveRepository hiveRepository,
  }) : _hiveRepository = hiveRepository;

  Future<void> save(String key, Map<String, dynamic> value) async {
    _hiveRepository.save(key, value);
  }
}
