import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/resume_entity.dart';

class ResumeMapper {
  static ResumeEntity fromMap(Map<String, dynamic> json) => ResumeEntity(
        id: json['id'] as String?,
        damageSumary18: (json['damageSumary18'] as Map<String, dynamic>).map(
          (k, e) => MapEntry($enumDecode(_$DamageTypeEnumMap, k), e as int),
        ),
        damageSumary68: (json['damageSumary68'] as Map<String, dynamic>).map(
          (k, e) => MapEntry($enumDecode(_$DamageTypeEnumMap, k), e as int),
        ),
      );

  static Map<String, dynamic> toJson(ResumeEntity instance) =>
      <String, dynamic>{
        'id': instance.id,
        'damageSumary18': instance.damageSumary18
            .map((k, e) => MapEntry(_$DamageTypeEnumMap[k], e)),
        'damageSumary68': instance.damageSumary68
            .map((k, e) => MapEntry(_$DamageTypeEnumMap[k], e)),
      };
}

const _$DamageTypeEnumMap = {
  DamageType.bug: 'bug',
  DamageType.engine: 'engine',
  DamageType.drop: 'drop',
  DamageType.diamont: 'diamont',
};
