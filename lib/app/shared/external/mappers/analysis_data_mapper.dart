import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';

mixin AnalysisMapper implements Mapper<Analysis> {
  Map<String, dynamic> toMap(Analysis analysis) {
    return {
      'id': analysis.id,
      // 'name': Analysis.name,
      // 'points': Analysis.points,
      // 'dateanalysis': Analysis.dateAnalysis.millisecondsSinceEpoch,
      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }

  Analysis fromMap(Map<dynamic, dynamic> map) {
    return Analysis(
      id: map['id'],
      sample: '',
      concentration: 0,
      date: DateTime.now(),
      local: '',
      numberSeeds: '',
      viability: 0,
      vigor: 0,

      // name: map['name'],
      // points: map['points'],
      // dateanalysis: DateTime.fromMillisecondsSinceEpoch(map['dateanalysis']),
      // completed: map['completed'],
      // addresses: map['addresses'] == null ? [] : (map['addresses'] as List).map((e) => AddressMapper.fromMap(e as Map)).toList(),
    );
  }
}
