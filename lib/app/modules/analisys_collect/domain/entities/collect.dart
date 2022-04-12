import 'package:tetrazolium/app/shared/domain/entities/entity.dart';
import 'package:uuid/uuid.dart';

enum DamageType {
  bug,
  engine,
  drop,
  diamont,
}

class Collect extends Entity {
  final String number;
  int classification = 0;
  int damageEngine = 0;
  int damageHumidity = 0;
  int damageBug = 0;
  int hard = 0;

  Collect(
    this.number, {
    String? id,
  }) : super(id ?? Uuid().v4());

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
