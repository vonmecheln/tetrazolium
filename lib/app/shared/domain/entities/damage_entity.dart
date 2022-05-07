class DamageEntity {
  final String type;
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
