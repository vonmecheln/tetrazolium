import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'damage_model.g.dart';

@JsonSerializable()
class DamageModel extends Damage {
  DamageModel({
    required String type,
    required bool main,
  }) : super(
          type: type,
          main: main,
        );

  // factory DamageModel.fromJson(Map<String, dynamic> json) =>
  //     _$DamageModelFromJson(json);
  // Map<String, dynamic> toJson() => _$DamageModelToJson(this);
}
