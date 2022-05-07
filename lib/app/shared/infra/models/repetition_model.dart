import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';

// part 'repetition_model.g.dart';

@JsonSerializable()
class RepetitionModel extends RepetitionEntity {
  RepetitionModel({
    required int number,
    required int viability,
    required int vigor,
    required List<InterpretationEntity> interpretation,
  }) : super(
          number: number,
          viability: viability,
          vigor: vigor,
          interpretation: interpretation,
        );

  // factory RepetitionModel.fromJson(Map<String, dynamic> json) =>
  //     _$RepetitionModelFromJson(json);
  // Map<String, dynamic> toJson() => _$RepetitionModelToJson(this);
}
