import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:memory_conatiner/features/add/data/data_source/hive_client.dart';

void main() async {
  Hive.init(Directory.current.path);

  HiveClient hiveClient = HiveClient();

  try {
    await hiveClient.initialize('test');
  } catch (e) {
    debugPrint(e.toString());

    return;
  }

  test('Put & Get', () async {
    Map<String, dynamic> testData = {'data': 1};

    Map<String, dynamic> getData = {};

    try {
      await hiveClient.save('test', testData);

      getData = await hiveClient.get('test');
    } catch (e) {
      debugPrint('error save : $e');
    }

    expect(getData, testData);
  });
}
