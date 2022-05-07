import 'package:tetrazolium/app/shared/domain/entities/collect.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';

mixin CollectMapper implements Mapper<Collect> {
  Map<String, dynamic> toMap(Collect collect) {
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

  Collect fromMap(Map<dynamic, dynamic> map) {
    return Collect(
      '',
      id: map['id'],
      // sample: map['sample'],
      // concentration: map['concentration'],
      // date: DateTime.fromMillisecondsSinceEpoch(map['date']),
      // local: map['local'],
      // numberSeeds: map['numberSeeds'],
      // viability: map['viability'],
      // vigor: map['vigor'],

      // completed: map['completed'],
      // addresses: map['addresses'] == null ? [] : (map['addresses'] as List).map((e) => AddressMapper.fromMap(e as Map)).toList(),
    );
  }
}
