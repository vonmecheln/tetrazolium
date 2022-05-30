import 'package:json_annotation/json_annotation.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';

class PhotoMapper {
  static PhotoEntity fromMap(Map<String, dynamic> json) => PhotoEntity(
        name: json['name'] as String,
        type: $enumDecode(_$PhotoTypeEnumMap, json['type']),
      );

  static Map<String, dynamic> toMap(PhotoEntity instance) => <String, dynamic>{
        'name': instance.name,
        'type': _$PhotoTypeEnumMap[instance.type],
      };
}

const _$PhotoTypeEnumMap = {
  PhotoType.external: 'external',
  PhotoType.internal: 'internal',
};
