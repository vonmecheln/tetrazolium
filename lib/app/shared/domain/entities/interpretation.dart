import 'damage.dart';
import 'photo.dart';

abstract class Interpretation {
  final int classification;
  final List<Photo> photos = [];
  final List<Damage> damages = [];

  Interpretation({
    required this.classification,
  });
}
