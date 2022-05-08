import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/external/mappers/interpretation_data_mapper.dart';

class RepetitionMapper {
  static RepetitionEntity fromMap(Map<String, dynamic> json) =>
      RepetitionEntity(
        id: json['id'] as String?,
        number: json['number'] as int,
        viability: json['viability'] as int,
        vigor: json['vigor'] as int,
        interpretations: json['interpretations'] == null
            ? []
            : (json['interpretations'] as List)
                .map((e) => InterpretationMapper.fromMap(e))
                .toList(),
      );

  static Map<String, dynamic> toMap(RepetitionEntity instance) =>
      <String, dynamic>{
        'id': instance.id,
        'number': instance.number,
        'viability': instance.viability,
        'vigor': instance.vigor,
        'interpretations': instance.interpretations
            .map((e) => InterpretationMapper.toMap(e))
            .toList(),
      };
}
