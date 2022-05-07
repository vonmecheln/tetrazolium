import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';

enum DamageType {
  bug,
  engine,
  drop,
  diamont,
}

class CollectEntity extends Entity {
  final String number;
  final int classification;
  final int damageEngine;
  final int damageHumidity;
  final int damageBug;
  final int hard;

  CollectEntity({
    String? id,
    required this.number,
    required this.classification,
    required this.damageEngine,
    required this.damageHumidity,
    required this.damageBug,
    required this.hard,
  }) : super(id ?? Uuid().v4());

  CollectEntity copyWith({
    String? id,
    String? number,
    int? classification,
    int? damageEngine,
    int? damageHumidity,
    int? damageBug,
    int? hard,
  }) {
    return CollectEntity(
      id: id ?? this.id,
      number: number ?? this.number,
      classification: classification ?? this.classification,
      damageEngine: damageEngine ?? this.damageEngine,
      damageHumidity: damageHumidity ?? this.damageHumidity,
      damageBug: damageBug ?? this.damageBug,
      hard: hard ?? this.hard,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'number': number,
      'classification': classification,
      'damage': {
        'bug': damageBug,
        'engine': damageEngine,
        'humidity': damageHumidity,
      },
      'hard': hard,

      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }

  Map<DamageType, int> damageMap() {
    return {
      DamageType.bug: damageBug,
      DamageType.engine: damageEngine,
      DamageType.drop: damageHumidity,
      DamageType.diamont: hard,
    };
  }
}
