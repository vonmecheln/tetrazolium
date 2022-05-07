import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';

class RepetitionEntity extends Entity {
  final int number;
  final int viability;
  final int vigor;

  RepetitionEntity({
    String? id,
    required this.number,
    required this.viability,
    required this.vigor,
  }) : super(id ?? Uuid().v4());
}
