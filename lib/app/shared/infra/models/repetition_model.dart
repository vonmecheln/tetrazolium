import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/infra/models/interpretation_model.dart';

// part 'repetition_model.g.dart';

// @JsonSerializable()
class RepetitionModel extends RepetitionEntity {
  RepetitionModel({
    required int number,
    required int viability,
    required int vigor,
    required List<InterpretationModel> interpretation,
  }) : super(
          number: number,
          viability: viability,
          vigor: vigor,
          interpretations: interpretation,
        );

  // factory RepetitionModel.fromJson(Map<String, dynamic> json) =>
  //     _$RepetitionModelFromJson(json);
  // Map<String, dynamic> toJson() => _$RepetitionModelToJson(this);
}
