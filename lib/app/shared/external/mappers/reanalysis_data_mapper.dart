import 'package:tetrazolium/app/shared/domain/entities/reanalysis_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';
import 'package:tetrazolium/app/shared/external/mappers/reinterpretation_data_mapper.dart';

class ReanalysisMapper {
  static ReanalysisEntity fromMap(Map<dynamic, dynamic> json) =>
      ReanalysisEntity(
        id: json['id'] as String?,
        analiseId:
            json['analise_id'] == null ? '' : json['analise_id'] as String,
        interpretationId: json['interpretation_id'] == null
            ? ''
            : json['interpretation_id'] as String,
        repetitionId: json['repetition_id'] == null
            ? ''
            : json['repetition_id'] as String,
        u: json['u'] == null ? '' : json['u'] as String,
        reinterpretations: json['reinterpretations'] == null
            ? []
            : (json['reinterpretations'] as List)
                .map((e) => ReinterpretationMapper.fromMap(e))
                .toList(),
      );

  static Map<String, dynamic> toMap(ReanalysisEntity instance) =>
      <String, dynamic>{
        'id': instance.id,
        'analise_id': instance.analiseId,
        'interpretation_id': instance.interpretationId,
        'repetition_id': instance.repetitionId,
        'u': instance.u,
        'reinterpretations': instance.reinterpretations
            .map((e) => ReinterpretationMapper.toMap(e))
            .toList(),
      };
}

mixin ReanalysisMapperMixin implements Mapper<ReanalysisEntity> {
  @override
  ReanalysisEntity fromMap(Map<dynamic, dynamic> json) => ReanalysisEntity(
        id: json['id'] as String?,
        analiseId:
            json['analise_id'] == null ? '' : json['analise_id'] as String,
        interpretationId: json['interpretation_id'] == null
            ? ''
            : json['interpretation_id'] as String,
        repetitionId: json['repetition_id'] == null
            ? ''
            : json['repetition_id'] as String,
        u: json['u'] == null ? '' : json['u'] as String,
        reinterpretations: json['reinterpretations'] == null
            ? []
            : (json['reinterpretations'] as List)
                .map((e) => ReinterpretationMapper.fromMap(e))
                .toList(),
      );

  @override
  Map<String, dynamic> toMap(ReanalysisEntity instance) => <String, dynamic>{
        'id': instance.id,
        'analise_id': instance.analiseId,
        'interpretation_id': instance.interpretationId,
        'repetition_id': instance.repetitionId,
        'u': instance.u,
        'reinterpretations': instance.reinterpretations
            .map((e) => ReinterpretationMapper.toMap(e))
            .toList(),
      };
}
