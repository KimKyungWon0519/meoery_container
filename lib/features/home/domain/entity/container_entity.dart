import 'package:equatable/equatable.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

class ContainerEntity extends Equatable {
  final String date;
  final List<MemoryEntity> memories;

  const ContainerEntity({
    this.date = '',
    this.memories = const [],
  });

  ContainerEntity copyWith({
    String? date,
    List<MemoryEntity>? memories,
  }) {
    return ContainerEntity(
      date: date ?? this.date,
      memories: memories ?? this.memories,
    );
  }

  @override
  List<Object?> get props => [date];
}
