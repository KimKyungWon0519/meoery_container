import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:memory_conatiner/core/shared_feature/data/data_source/hive_client.dart';
import 'package:memory_conatiner/core/shared_feature/data/repository/memory_repository_impl.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';
import 'package:memory_conatiner/core/shared_feature/domain/repository/memory_repository.dart';

void main() async {
  Hive.init(Directory.current.path);
  Hive.deleteBoxFromDisk('test');

  HiveClient hiveClient = HiveClient();

  try {
    await hiveClient.initialize('test');
  } catch (e) {
    debugPrint(e.toString());

    return;
  }

  MemoryRepository memoryRepository =
      MemoryRepositoryImpl(hiveClient: hiveClient);

  group('Memoery Repository add and get', () {
    List<MemoryEntity> entities = [];
    test('first insert', () async {
      MemoryEntity entity =
          const MemoryEntity(title: 'test', content: 'test', date: '20230101');

      try {
        await memoryRepository.add(entity.date, entity);

        entities = await memoryRepository.get(entity.date);
      } catch (e) {
        debugPrint('error save : $e');
      }

      expect(entities[0], entity);
    });

    test('second insert', () async {
      MemoryEntity entity =
          const MemoryEntity(title: 'test', content: 'test', date: '20230101');

      try {
        await memoryRepository.add(entity.date, entity);

        entities = await memoryRepository.get(entity.date);
      } catch (e) {
        debugPrint('error save : $e');
      }

      expect(entities[1], entity);
    });

    test('check length', () {
      expect(entities.length, 2);
    });
  });
}
