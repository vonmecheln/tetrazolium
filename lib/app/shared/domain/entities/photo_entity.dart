import 'package:copy_with_extension/copy_with_extension.dart';

part 'photo_entity.g.dart';

@CopyWith()
// @JsonSerializable()
class PhotoEntity {
  final String name;
  final PhotoType type;

  PhotoEntity({
    required this.name,
    required this.type,
  });
}

enum PhotoType {
  external,
  internal,
}
