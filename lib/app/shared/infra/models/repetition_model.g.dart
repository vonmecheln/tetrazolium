// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'repetition_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RepetitionModel _$RepetitionModelFromJson(Map<String, dynamic> json) {
  return RepetitionModel(
    number: json['number'] as int,
    viability: json['viability'] as int,
    vigor: json['vigor'] as int,
  );
}

Map<String, dynamic> _$RepetitionModelToJson(RepetitionModel instance) =>
    <String, dynamic>{
      'number': instance.number,
      'viability': instance.viability,
      'vigor': instance.vigor,
    };
