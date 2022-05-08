import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/external/mappers/interpretation_data_mapper.dart';

void main() {
  group('interpretation data mapper ...', () {
    test('deve converter um map em um objeto do tipo InterpretationEntity', () {
      final interpretation = InterpretationMapper.fromMap({
        'classification': 1,
        'photos': [],
        'damages': [],
      });

      expect(interpretation, isA<InterpretationEntity>());
      expect(interpretation.classification, 1);
      expect(interpretation.photos, isA<List<PhotoEntity>>());
      expect(interpretation.damages, isA<List<DamageEntity>>());
    });

    test(
        'deve converter um map sem dependencias em um objeto do tipo InterpretationEntity',
        () {
      final interpretation = InterpretationMapper.fromMap({
        'classification': 1,
      });

      expect(interpretation, isA<InterpretationEntity>());
      expect(interpretation.classification, 1);
      expect(interpretation.photos, isA<List<PhotoEntity>>());
      expect(interpretation.damages, isA<List<DamageEntity>>());
    });

    test('deve converte InterpretationEntity to Map', () {
      final interpretation = InterpretationEntity(
        classification: 1,
        photos: [],
        damages: [],
      );
      final map = InterpretationMapper.toMap(interpretation);

      expect(map['classification'], 1);
      expect(map['photos'], []);
      expect(map['damages'], []);
    });
  });
}
