import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';

class DamageMapper {
  static DamageEntity fromMap(Map<String, dynamic> json) => DamageEntity(
        type: $enumDecode(_$DamageTypeEnumMap, json['type']),
        main: json['main'] as bool,
      );

  static Map<String, dynamic> toMap(DamageEntity instance) => <String, dynamic>{
        'type': _$DamageTypeEnumMap[instance.type],
        'main': instance.main,
      };
}

const _$DamageTypeEnumMap = {
  DamageType.bug: 'bug',
  DamageType.engine: 'engine',
  DamageType.drop: 'drop',
  DamageType.diamont: 'diamont',
};
