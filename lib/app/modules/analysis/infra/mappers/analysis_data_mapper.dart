import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
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
