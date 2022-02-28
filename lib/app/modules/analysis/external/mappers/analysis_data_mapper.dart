import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/external/datasource/datasource.dart';
import 'package:tetrazolium/app/modules/analysis/infra/models/analysis_model.dart';

abstract class AnalysisDataMapper {
  static Analysis mapper(DocumentSnapshot documentSnapshot) {
    return AnalysisModel(
      amostra: documentSnapshot['amostra'],
      concentration: documentSnapshot['concentration'],
      date: documentSnapshot['date'],
      local: documentSnapshot['local'],
      viability: documentSnapshot['viability'],
      vigor: documentSnapshot['vigor'],
    );
  }
}

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
      amostra: map['amostra'],
      concentration: map['concentration'],
      date: map['date'],
      local: map['local'],
      viability: map['viability'],
      vigor: map['vigor'],

      // name: map['name'],
      // points: map['points'],
      // dateanalysis: DateTime.fromMillisecondsSinceEpoch(map['dateanalysis']),
      // completed: map['completed'],
      // addresses: map['addresses'] == null ? [] : (map['addresses'] as List).map((e) => AddressMapper.fromMap(e as Map)).toList(),
    );
  }
}
