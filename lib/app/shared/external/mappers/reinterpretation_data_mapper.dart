import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/external/mappers/damage_data_mapper.dart';

class ReinterpretationMapper {
  static ReinterpretationEntity fromMap(Map<String, dynamic> json) =>
      ReinterpretationEntity(
        id: json['id'] as String?,
        classification: json['classification'] as int,
        damages: json['damages'] == null
            ? []
            : (json['damages'] as List)
                .map((e) => DamageMapper.fromMap(e))
                .toList(),
        u: json['u'] == null ? '' : json['u'] as String,
      );

  static Map<String, dynamic> toMap(ReinterpretationEntity instance) =>
      <String, dynamic>{
        'id': instance.id,
        'classification': instance.classification,
        'damages': instance.damages.map((e) => DamageMapper.toMap(e)).toList(),
        'u': instance.u,
      };
}
