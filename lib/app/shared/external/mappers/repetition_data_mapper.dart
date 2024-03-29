import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/domain/entities/resume_entity.dart';
import 'package:tetrazolium/app/shared/external/mappers/interpretation_data_mapper.dart';
import 'package:tetrazolium/app/shared/external/mappers/resume_data_map.dart';

class RepetitionMapper {
  static RepetitionEntity fromMap(Map<String, dynamic> json) =>
      RepetitionEntity(
        id: json['id'] as String?,
        state: $enumDecodeNullable(_$RepetitionStateEnumMap, json['state']) ??
            RepetitionState.notStarted,
        number: json['number'] as int,
        viability: json['viability'] as int,
        vigor: json['vigor'] as int,
        interpretations: json['interpretations'] == null
            ? []
            : (json['interpretations'] as List)
                .map((e) => InterpretationMapper.fromMap(e))
                .toList(),
        resultClassication:
            (json['resultClassication'] as Map<String, dynamic>).map(
          (k, e) => MapEntry(int.parse(k), e as int),
        ),
        resume: json['resume'] == null
            ? ResumeEntity.empty()
            : ResumeMapper.fromMap(json['resume']),
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
        'state': _$RepetitionStateEnumMap[instance.state],
        'resultClassication': instance.resultClassication
            .map((k, e) => MapEntry(k.toString(), e)),
        'resume': ResumeMapper.toJson(instance.resume),
      };
}

const _$RepetitionStateEnumMap = {
  RepetitionState.notStarted: 'notStarted',
  RepetitionState.started: 'started',
  RepetitionState.finish: 'finish',
};
