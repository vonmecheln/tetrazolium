import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';
import 'index.dart';

part 'reinterpretation_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class ReinterpretationEntity extends Entity {
  final int classification;
  final List<DamageEntity> damages;
  final String u;

  ReinterpretationEntity(
      {String? id,
      required this.classification,
      required this.damages,
      required this.u})
      : super(id ?? const Uuid().v4());

  factory ReinterpretationEntity.empty() =>
      ReinterpretationEntity(classification: 1, damages: [], u: '');
}
