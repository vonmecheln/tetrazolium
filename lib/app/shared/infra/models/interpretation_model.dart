import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/infra/models/damage_model.dart';
import 'package:tetrazolium/app/shared/infra/models/photo_model.dart';

// part 'interpretation_model.g.dart';

// @JsonSerializable()
class InterpretationModel extends InterpretationEntity {
  InterpretationModel({
    required int classification,
    required List<PhotoModel> photos,
    required List<DamageModel> damages,
  }) : super(
          classification: classification,
          photos: photos,
          damages: damages,
        );

  // factory InterpretationModel.fromJson(Map<String, dynamic> json) =>
  //     _$InterpretationModelFromJson(json);
  // Map<String, dynamic> toJson() => _$InterpretationModelToJson(this);
}
