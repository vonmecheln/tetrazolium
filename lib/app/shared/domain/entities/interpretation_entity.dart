import 'damage.dart';
import 'photo.dart';

class InterpretationEntity {
  final int classification;
  final List<Photo> photos;
  final List<Damage> damages;

  InterpretationEntity({
    required this.classification,
    required this.photos,
    required this.damages,
  });
}
