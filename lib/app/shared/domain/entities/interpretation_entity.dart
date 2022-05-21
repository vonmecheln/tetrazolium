import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';
import 'index.dart';

part 'interpretation_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class InterpretationEntity {
  final int classification;
  final List<PhotoEntity> photos;
  final List<DamageEntity> damages;

  InterpretationEntity({
    required this.classification,
    required this.photos,
    required this.damages,
  });

  factory InterpretationEntity.empty() => InterpretationEntity(
        classification: 1,
        photos: [],
        damages: [],
      );
}
