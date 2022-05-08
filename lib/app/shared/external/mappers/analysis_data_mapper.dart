import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';
import 'package:tetrazolium/app/shared/external/mappers/repetition_data_mapper.dart';

mixin AnalysisMapper implements Mapper<AnalysisEntity> {
  Map<String, dynamic> toMap(AnalysisEntity entity) {
    return {
      'id': entity.id,
      'date': entity.date.millisecondsSinceEpoch,
      'sample': entity.sample,
      'local': entity.local,
      'numberSeeds': entity.numberSeeds,
      'concentration': entity.concentration,
      'viability': entity.viability,
      'vigor': entity.vigor,
      'repetitions':
          entity.repetitions.map((e) => RepetitionMapper.toMap(e)).toList(),
    };
  }

  AnalysisEntity fromMap(Map<dynamic, dynamic> map) {
    return AnalysisEntity(
      id: map['id'],
      sample: map['sample'],
      concentration: map['concentration'],
      date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      local: map['local'],
      numberSeeds: map['numberSeeds'],
      viability: map['viability'],
      vigor: map['vigor'],
      repetitions: map['repetitions'] == null
          ? []
          : (map['repetitions'] as List)
              .map((e) => RepetitionMapper.fromMap(e))
              .toList(),
    );
  }
}
