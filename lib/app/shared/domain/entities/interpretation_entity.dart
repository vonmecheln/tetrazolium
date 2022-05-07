import 'damage_entity.dart';
import 'photo_entity.dart';

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
