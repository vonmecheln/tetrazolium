import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'interpretation_model.g.dart';

@JsonSerializable()
class InterpretationModel extends InterpretationEntity {
  InterpretationModel({
    required int classification,
    // required List<Photo> photos,
    // required List<Damage> damages,
  }) : super(
          classification: classification,
          // photos: photos,
          // damages: damages,
        );

  // factory InterpretationModel.fromJson(Map<String, dynamic> json) =>
  //     _$InterpretationModelFromJson(json);
  // Map<String, dynamic> toJson() => _$InterpretationModelToJson(this);
}
