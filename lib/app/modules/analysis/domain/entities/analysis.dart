import 'package:tetrazolium/app/modules/analysis/domain/entities/entity.dart';

// import 'package:uuid/uuid.dart';

class Analysis extends Entity {
  final DateTime date;
  final String amostra;
  final String local;
  final double concentration;
  final int viability;
  final int vigor;
  final List repetition = [];

  Analysis({
    String? id,
    required this.date,
    required this.amostra,
    required this.local,
    required this.concentration,
    required this.viability,
    required this.vigor,
  }) : super(id ?? '');
}
