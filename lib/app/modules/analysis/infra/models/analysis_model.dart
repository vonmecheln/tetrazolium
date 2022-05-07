import 'package:json_annotation/json_annotation.dart';
import '../../../../shared/domain/entities/analysis_entity.dart';

// part 'analysis_model.g.dart';

@JsonSerializable()
class AnalysisModel extends AnalysisEntity {
  AnalysisModel({
    required DateTime date,
    required String sample,
    required String local,
    required String numberSeeds,
    required double concentration,
    required int viability,
    required int vigor,
  }) : super(
          date: date,
          sample: sample,
          local: local,
          numberSeeds: numberSeeds,
          concentration: concentration,
          viability: viability,
          vigor: vigor,
        );

  // factory AnalysisModel.fromJson(Map<String, dynamic> json) =>
  //     _$AnalysisModelFromJson(json);
  // Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
}
