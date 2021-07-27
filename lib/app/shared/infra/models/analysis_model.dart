import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';

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
          amostra: amostra,
          local: local,
          concentration: concentration,
          viability: viability,
          vigor: vigor,
        );

  factory AnalysisModel.fromJson(Map<String, dynamic> json) =>
      _$AnalysisModelFromJson(json);
  Map<String, dynamic> toJson() => _$AnalysisModelToJson(this);
}
