import 'package:json_annotation/json_annotation.dart';
import '../../domain/entities/analysis.dart';

part 'analysis_model.g.dart';

@JsonSerializable()
class AnalysisModel extends Analysis {
  AnalysisModel({
    required DateTime date,
    required String amostra,
    required String local,
    required double concentration,
    required int viability,
    required int vigor,
  }) : super(
          date: date,
          sample: amostra,
          local: local,
          concentration: concentration,
          viability: viability,
          vigor: vigor,
        );

  factory AnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$AnalysisModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
}
