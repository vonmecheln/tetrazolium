import 'damage.dart';
import 'photo.dart';

class Interpretation {
  final int classification;
  final List<Photo> photos;
  final List<Damage> damages;

  Interpretation({
    required this.classification,
    required this.photos,
    required this.damages,
  });
}
