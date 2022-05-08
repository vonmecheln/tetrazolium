import 'package:tetrazolium/app/shared/domain/entities/index.dart';

class PhotoMapper {
  static PhotoEntity fromMap(Map<String, dynamic> json) => PhotoEntity(
        name: json['name'] as String,
      );

  static Map<String, dynamic> toMap(PhotoEntity instance) => <String, dynamic>{
        'name': instance.name,
      };
}
