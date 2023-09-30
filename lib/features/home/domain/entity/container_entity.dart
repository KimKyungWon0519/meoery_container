import 'package:equatable/equatable.dart';
import 'package:memory_conatiner/core/shared_feature/domain/entity/memory_entity.dart';

class ContainerEntity extends Equatable {
  final String date;
  final List<MemoryEntity> memories;

  const ContainerEntity({
    required this.date,
    required this.memories,
  });

  @override
  List<Object?> get props => [date];
}
