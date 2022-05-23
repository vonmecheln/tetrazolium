import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/damage_entity.dart';
import 'package:tetrazolium/app/shared/external/mappers/damage_data_mapper.dart';

void main() {
  group('damage data mapper ...', () {
    test('deve converter um map em um objeto do tipo DamageEntity', () {
      final damage = DamageMapper.fromMap({
        'type': 'bug',
        'main': true,
      });

      expect(damage, isA<DamageEntity>());
      expect(damage.type, DamageType.bug);
      expect(damage.main, true);
    });

    test('deve converte DamageEntity to Map', () {
      final damage = DamageEntity(type: DamageType.bug, main: true);
      final map = DamageMapper.toMap(damage);

      expect(map['type'], 'bug');
      expect(map['main'], true);
    });
  });
}
