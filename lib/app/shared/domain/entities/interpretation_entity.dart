import 'package:copy_with_extension/copy_with_extension.dart';

import 'damage_entity.dart';
import 'photo_entity.dart';

part 'interpretation_entity.g.dart';

@CopyWith()
class InterpretationEntity {
  final int classification;
  final List<PhotoEntity> photos;
  final List<DamageEntity> damages;

  InterpretationEntity({
    required this.classification,
    required this.photos,
    required this.damages,
  });
}
