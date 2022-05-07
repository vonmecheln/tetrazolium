import 'package:copy_with_extension/copy_with_extension.dart';

part 'damage_entity.g.dart';

@CopyWith()
class DamageEntity {
  final DamageType type;
  final bool main;

  DamageEntity({
    required this.type,
    required this.main,
  });
}

enum DamageType {
  bug,
  engine,
  drop,
  diamont,
}
