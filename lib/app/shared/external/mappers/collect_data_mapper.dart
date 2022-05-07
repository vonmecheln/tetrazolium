import 'package:tetrazolium/app/shared/domain/entities/collect_entity.dart';

class CollectMapper {
  static Map<String, dynamic> toMap(CollectEntity collect) {
    return {
      'id': collect.id,
      // 'date': collect.date.millisecondsSinceEpoch,
      // 'sample': collect.sample,
      // 'local': collect.local,
      // 'numberSeeds': collect.numberSeeds,
      // 'concentration': collect.concentration,
      // 'viability': collect.viability,
      // 'vigor': collect.vigor,

      // 'completed': Analysis.completed,
      // 'addresses': Analysis.addresses.map((e) => AddressMapper.toMap(e)).toList()
    };
  }

  static CollectEntity fromMap(Map<dynamic, dynamic> map) {
    return CollectEntity(
      id: map['id'],
      classification: 0,
      damageBug: 0,
      damageEngine: 0,
      damageHumidity: 0,
      hard: 0,
      number: '',
    );
  }
}
