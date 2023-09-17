import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:memory_conatiner/core/shared_feature/data/data_source/hive_client.dart';
import 'package:memory_conatiner/core/shared_feature/data/repository/memory_repository_impl.dart';
import 'package:memory_conatiner/core/shared_feature/domain/repository/memory_repository.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:memory_conatiner/features/add/domain/usecase/memory_usecase.dart'
    as HiveUseCase;

Future init() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentsDir.path);

  HiveClient hiveClient = HiveClient();

  hiveClient.initialize('memory_container');

  MemoryRepository hiveRepository =
      MemoryRepositoryImpl(hiveClient: hiveClient);
  HiveUseCase.Save saveUseCase =
      HiveUseCase.Save(hiveRepository: hiveRepository);

  addViewModelProvider =
      Provider<AddViewModel>((ref) => AddViewModel(saveUseCase: saveUseCase));
}
