import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:memory_conatiner/core/shared_feature/data/data_source/hive_client.dart';
import 'package:memory_conatiner/core/shared_feature/data/repository/memory_repository_impl.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/core/shared_feature/domain/repository/memory_repository.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';
import 'package:memory_conatiner/features/home/domain/entity/container_entity.dart';
import 'package:memory_conatiner/features/home/domain/usecase/memory_usecase.dart';
import 'package:memory_conatiner/features/home/presentation/presenster/home_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:memory_conatiner/features/add/domain/usecase/memory_usecase.dart'
    as HiveUseCase;

Future init() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentsDir.path);

  // TODO : Delete this code when create delete feature
  Hive.deleteBoxFromDisk('memory_container');

  HiveClient hiveClient = HiveClient();

  await hiveClient.initialize('memory_container');

  MemoryRepository hiveRepository =
      MemoryRepositoryImpl(hiveClient: hiveClient);
  HiveUseCase.Save saveUseCase =
      HiveUseCase.Save(hiveRepository: hiveRepository);
  Get get = Get(hiveRepository: hiveRepository);
  Delete delete = Delete(hiveRepository: hiveRepository);

  addViewModelProvider =
      Provider<AddViewModel>((ref) => AddViewModel(saveUseCase: saveUseCase));
  homeViewModelProvider = StateNotifierProvider<HomeViewModel, ContainerEntity>(
      (ref) => HomeViewModel(get: get, delete: delete));
}
