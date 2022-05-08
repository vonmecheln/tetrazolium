import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'damage_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class DamageEntity {
  final DamageType type;
  final bool main;

  DamageEntity({
    required this.type,
    required this.main,
  });
}

enum DamageType {
  bug,
  engine,
  drop,
  diamont,
}
