import 'package:flutter/material.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

class ViewPage extends StatelessWidget {
  final MemoryEntity memoryEntity;

  const ViewPage({
    super.key,
    required this.memoryEntity,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(memoryEntity.date),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              memoryEntity.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const Divider(),
            Expanded(
              child: SingleChildScrollView(
                child: Text(memoryEntity.content),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
