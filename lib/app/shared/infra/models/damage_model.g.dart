// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'damage_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DamageModel _$DamageModelFromJson(Map<String, dynamic> json) => DamageModel(
      type: json['type'] as String,
      main: json['main'] as bool,
    );

Map<String, dynamic> _$DamageModelToJson(DamageModel instance) =>
    <String, dynamic>{
      'type': _$DamageTypeEnumMap[instance.type],
      'main': instance.main,
    };

const _$DamageTypeEnumMap = {
  DamageType.bug: 'bug',
  DamageType.engine: 'engine',
  DamageType.drop: 'drop',
  DamageType.diamont: 'diamont',
};
