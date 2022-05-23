import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';

part 'resume_entity.g.dart';

@CopyWith()
class ResumeEntity extends Entity {
  final Map<DamageType, int> damageSumary18;
  final Map<DamageType, int> damageSumary68;

  ResumeEntity({
    String? id,
    required this.damageSumary18,
    required this.damageSumary68,
  }) : super(id ?? Uuid().v4());

  factory ResumeEntity.empty() => ResumeEntity(
        damageSumary18: _makeZeroMap(),
        damageSumary68: _makeZeroMap(),
      );
}

_makeZeroMap() => {
      DamageType.bug: 0,
      DamageType.drop: 0,
      DamageType.engine: 0,
      DamageType.diamont: 0,
    };
