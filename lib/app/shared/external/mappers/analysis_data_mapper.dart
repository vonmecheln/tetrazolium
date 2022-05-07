import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';

mixin AnalysisMapper implements Mapper<AnalysisEntity> {
  Map<String, dynamic> toMap(AnalysisEntity analysis) {
    return {
      'id': analysis.id,
      'date': analysis.date.millisecondsSinceEpoch,
      'sample': analysis.sample,
      'local': analysis.local,
      'numberSeeds': analysis.numberSeeds,
      'concentration': analysis.concentration,
      'viability': analysis.viability,
      'vigor': analysis.vigor,
      'repetition': []
      // 'repetition': analysis.repetition.map((e) => AddressMapper.toMap(e)).toList()
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

      // completed: map['completed'],
      // addresses: map['addresses'] == null ? [] : (map['addresses'] as List).map((e) => AddressMapper.fromMap(e as Map)).toList(),
    );
  }
}
