import 'package:tetrazolium/app/shared/domain/entities/index.dart';

class RepetitionMapper {
  static RepetitionEntity fromMap(Map map) {
    return RepetitionEntity(
      number: map['number'],
      viability: map['viability'],
      vigor: map['vigor'],
      interpretation: [],
    );
  }

  static Map<String, dynamic> toMap(RepetitionEntity entity) {
    return {
      'id': entity.id,
      'number': entity.number,
      'viability': entity.viability,
      'vigor': entity.vigor,
      'interpretation': ''
    };
  }
}
