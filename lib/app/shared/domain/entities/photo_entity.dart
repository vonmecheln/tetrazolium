import 'package:copy_with_extension/copy_with_extension.dart';

part 'photo_entity.g.dart';

@CopyWith()
class PhotoEntity {
  final String name;

  PhotoEntity({
    required this.name,
  });
}