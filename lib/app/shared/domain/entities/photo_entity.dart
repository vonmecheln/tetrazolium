import 'package:copy_with_extension/copy_with_extension.dart';
import 'package:json_annotation/json_annotation.dart';

part 'photo_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class PhotoEntity {
  final String name;

  PhotoEntity({
    required this.name,
  });
}
