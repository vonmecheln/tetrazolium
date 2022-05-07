import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/infra/models/repetition_model.dart';
import '../../domain/entities/analysis_entity.dart';

// part 'analysis_model.g.dart';

// @JsonSerializable(createToJson: true, createFactory: false)
class AnalysisModel extends AnalysisEntity {
  AnalysisModel({
    required DateTime date,
    required String sample,
    required String local,
    required String numberSeeds,
    required double concentration,
    required int viability,
    required int vigor,
    required List<RepetitionModel> repetition,
  }) : super(
          date: date,
          sample: sample,
          local: local,
          numberSeeds: numberSeeds,
          concentration: concentration,
          viability: viability,
          vigor: vigor,
          repetition: repetition,
        );

  // factory AnalysisModel.fromJson(Map<String, dynamic> json) =>
  //     _$AnalysisModelFromJson(json);
  // Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
}
