import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:uuid/uuid.dart';
import 'package:tetrazolium/app/shared/domain/entities/entity.dart';

part 'reanalysis_entity.g.dart';

@CopyWith()
class ReanalysisEntity extends Entity {
  final String analiseId;
  final String interpretationId;
  final String repetitionId;
  final String u;
  final List<ReinterpretationEntity> reinterpretations;

  ReanalysisEntity({
    String? id,
    required this.analiseId,
    required this.interpretationId,
    required this.repetitionId,
    required this.u,
    required this.reinterpretations,
  }) : super(id ?? const Uuid().v4());

  factory ReanalysisEntity.empty() => ReanalysisEntity(
        analiseId: '',
        interpretationId: '',
        repetitionId: '',
        u: '',
        reinterpretations: [],
      );
}
