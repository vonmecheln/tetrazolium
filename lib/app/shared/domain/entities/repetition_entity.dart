import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tetrazolium/app/shared/domain/entities/resume_entity.dart';
import 'package:uuid/uuid.dart';

import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';

part 'repetition_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class RepetitionEntity extends Entity {
  final int number;
  final int viability;
  final int vigor;
  final List<InterpretationEntity> interpretations;
  final RepetitionState state;
  final Map<int, int> resultClassication;
  final ResumeEntity resume;

  RepetitionEntity({
    String? id,
    this.state = RepetitionState.notStarted,
    required this.number,
    required this.viability,
    required this.vigor,
    required this.interpretations,
    required this.resultClassication,
    required this.resume,
  }) : super(id ?? const Uuid().v4());

  factory RepetitionEntity.empty() => RepetitionEntity(
        state: RepetitionState.notStarted,
        number: 0,
        viability: 0,
        vigor: 0,
        interpretations: [],
        resultClassication: {},
        resume: ResumeEntity.empty(),
      );
}

enum RepetitionState {
  notStarted,
  started,
  finish,
}
