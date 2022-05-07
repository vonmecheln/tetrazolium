import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_model.g.dart';

@JsonSerializable()
class PhotoModel extends PhotoEntity {
  PhotoModel({
    required String name,
  }) : super(
          name: name,
        );

  factory PhotoModel.fromJson(Map<String, dynamic> json) =>
      _$PhotoModelFromJson(json);
  Map<String, dynamic> toJson() => _$PhotoModelToJson(this);
}
