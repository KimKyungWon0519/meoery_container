import 'dart:io';

import 'package:hive/hive.dart';
import 'package:memory_conatiner/features/add/data/data_source/hive_client.dart';
import 'package:path_provider/path_provider.dart';

Future init() async {
  Directory appDocumentsDir = await getApplicationDocumentsDirectory();

  Hive.init(appDocumentsDir.path);

  HiveClient hiveClient = HiveClient();

  hiveClient.initialize('memory_container');
}
