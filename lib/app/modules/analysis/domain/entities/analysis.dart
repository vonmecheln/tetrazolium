import 'package:tetrazolium/app/modules/analysis/domain/entities/entity.dart';

import 'package:uuid/uuid.dart';

class Analysis extends Entity {
  final DateTime date;
  final String sample;
  final String local;
  final String numberSeeds;
  final double concentration;
  final int viability;
  final int vigor;
  final List repetition = [];

  Analysis({
    String? id,
    required this.date,
    required this.sample,
    required this.local,
    required this.numberSeeds,
    required this.concentration,
    required this.viability,
    required this.vigor,
  }) : super(id ?? Uuid().v4());
}
