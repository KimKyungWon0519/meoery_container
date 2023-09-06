import 'dart:io';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';
import 'package:memory_conatiner/features/add/data/data_source/hive_client.dart';
import 'package:memory_conatiner/features/add/data/repository/hive_repository_impl.dart';
import 'package:memory_conatiner/features/add/domain/repository/hive_repository.dart';
import 'package:memory_conatiner/features/add/presentation/presenter/add_view_model.dart';
import 'package:path_provider/path_provider.dart';
import 'package:memory_conatiner/features/add/domain/usecase/hive_usecase.dart'
    as HiveUseCase;

Future init() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentsDir.path);

  HiveClient hiveClient = HiveClient();

  hiveClient.initialize('memory_container');

  HiveRepository hiveRepository = HiveRepositoryImpl(hiveClient: hiveClient);
  HiveUseCase.Save saveUseCase =
      HiveUseCase.Save(hiveRepository: hiveRepository);

  addViewModelProvider =
      Provider<AddViewModel>((ref) => AddViewModel(saveUseCase: saveUseCase));
}
