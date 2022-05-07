import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:uuid/uuid.dart';

class RepetitionEntity extends Entity {
  final int number;
  final int viability;
  final int vigor;
  final List<InterpretationEntity> interpretation;

  RepetitionEntity({
    String? id,
    required this.number,
    required this.viability,
    required this.vigor,
    required this.interpretation,
  }) : super(id ?? Uuid().v4());
}
