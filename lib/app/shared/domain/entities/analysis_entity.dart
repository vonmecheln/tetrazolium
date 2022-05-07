import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';

import 'package:uuid/uuid.dart';

import 'package:copy_with_extension/copy_with_extension.dart';

part 'analysis_entity.g.dart';

@CopyWith()
class AnalysisEntity extends Entity {
  final DateTime date;
  final String sample;
  final String local;
  final String numberSeeds;
  final double concentration;
  final int viability;
  final int vigor;
  final List<RepetitionEntity> repetition;

  AnalysisEntity({
    String? id,
    required this.date,
    required this.sample,
    required this.local,
    required this.numberSeeds,
    required this.concentration,
    required this.viability,
    required this.vigor,
    required this.repetition,
  }) : super(id ?? Uuid().v4());

  @override
  String toString() {
    return 'id: $id, date: $date, sample: $sample, local: $local, numberSeeds: $numberSeeds, concentration: $concentration, viability: $viability, vigor: $vigor';
  }
}
