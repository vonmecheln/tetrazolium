// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'analysis_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AnalysisModel _$AnalysisModelFromJson(Map<String, dynamic> json) =>
    AnalysisModel(
      date: DateTime.parse(json['date'] as String),
      amostra: json['amostra'] as String,
      local: json['local'] as String,
      concentration: (json['concentration'] as num).toDouble(),
      viability: json['viability'] as int,
      vigor: json['vigor'] as int,
    );

Map<String, dynamic> _$AnalysisModelToJson(AnalysisModel instance) =>
    <String, dynamic>{
      'date': instance.date.toIso8601String(),
      'amostra': instance.sample,
      'local': instance.local,
      'concentration': instance.concentration,
      'viability': instance.viability,
      'vigor': instance.vigor,
    };
