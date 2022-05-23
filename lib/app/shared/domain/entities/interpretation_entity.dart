import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';
import 'index.dart';

part 'interpretation_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class InterpretationEntity extends Entity {
  final int classification;
  final List<PhotoEntity> photos;
  final List<DamageEntity> damages;

  InterpretationEntity({
    String? id,
    required this.classification,
    required this.photos,
    required this.damages,
  }) : super(id ?? Uuid().v4());

  factory InterpretationEntity.empty() => InterpretationEntity(
        classification: 1,
        photos: [],
        damages: [],
      );
}
