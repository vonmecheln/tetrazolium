import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/external/mappers/damage_data_mapper.dart';
import 'package:tetrazolium/app/shared/external/mappers/photo_data_mapper.dart';

class InterpretationMapper {
  static InterpretationEntity fromMap(Map<String, dynamic> json) =>
      InterpretationEntity(
        classification: json['classification'] as int,
        photos: json['photos'] == null
            ? []
            : (json['photos'] as List)
                .map((e) => PhotoMapper.fromMap(e))
                .toList(),
        damages: json['damages'] == null
            ? []
            : (json['damages'] as List)
                .map((e) => DamageMapper.fromMap(e))
                .toList(),
      );

  static Map<String, dynamic> toMap(InterpretationEntity instance) =>
      <String, dynamic>{
        'classification': instance.classification,
        'photos': instance.photos.map((e) => PhotoMapper.toMap(e)).toList(),
        'damages': instance.damages.map((e) => DamageMapper.toMap(e)).toList(),
      };
}
