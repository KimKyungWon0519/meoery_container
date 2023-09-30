import 'package:flutter/material.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

class MemoryItem extends StatelessWidget {
  final MemoryEntity memory;

  const MemoryItem({
    super.key,
    required this.memory,
  });

  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: UniqueKey(),
      child: Card(
        child: ListTile(
          title: Text(memory.title),
        ),
      ),
    );
  }
}
