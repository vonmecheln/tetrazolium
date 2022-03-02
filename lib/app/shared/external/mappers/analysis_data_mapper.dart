import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';

mixin AnalysisMapper implements Mapper<Analysis> {
  Map<String, dynamic> toMap(Analysis analysis) {
    return {
      'id': analysis.id,
      'date': analysis.date.millisecondsSinceEpoch,
      'sample': analysis.sample,
      'local': analysis.local,
      'numberSeeds': analysis.numberSeeds,
      'concentration': analysis.concentration,
      'viability': analysis.viability,
      'vigor': analysis.vigor,

      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }

  Analysis fromMap(Map<dynamic, dynamic> map) {
    return Analysis(
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
