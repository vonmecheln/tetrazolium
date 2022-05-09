import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';
import 'package:tetrazolium/app/shared/external/mappers/repetition_data_mapper.dart';

mixin AnalysisMapper implements Mapper<AnalysisEntity> {
  AnalysisEntity fromMap(Map<dynamic, dynamic> json) => AnalysisEntity(
        id: json['id'] as String?,
        date: DateTime.parse(json['date'] as String),
        sample: json['sample'] as String,
        local: json['local'] as String,
        numberSeeds: json['numberSeeds'] as String,
        concentration: (json['concentration'] as num).toDouble(),
        viability: json['viability'] as int,
        vigor: json['vigor'] as int,
        repetitions: json['repetitions'] == null
            ? []
            : (json['repetitions'] as List)
                .map((e) => RepetitionMapper.fromMap(e))
                .toList(),
      );

  Map<String, dynamic> toMap(AnalysisEntity instance) => <String, dynamic>{
        'id': instance.id,
        'date': instance.date.toIso8601String(),
        'sample': instance.sample,
        'local': instance.local,
        'numberSeeds': instance.numberSeeds,
        'concentration': instance.concentration,
        'viability': instance.viability,
        'vigor': instance.vigor,
        'repetitions':
            instance.repetitions.map((e) => RepetitionMapper.toMap(e)).toList(),
      };
}
