import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/resume_entity.dart';
import 'package:tetrazolium/app/shared/external/mappers/repetition_data_mapper.dart';

void main() {
  group('repetition data mapper ...', () {
    test('deve converter um map em um objeto do tipo RepetitionEntity', () {
      final repetition = RepetitionMapper.fromMap({
        'id': '123',
        'number': 1,
        'viability': 80,
        'vigor': 90,
        'interpretations': [],
      });

      expect(repetition, isA<RepetitionEntity>());
      expect(repetition.id, '123');
      expect(repetition.number, 1);
      expect(repetition.viability, 80);
      expect(repetition.vigor, 90);
      expect(repetition.interpretations, []);
    });

    test(
        'deve converter um map sem lista em um objeto do tipo RepetitionEntity',
        () {
      final repetition = RepetitionMapper.fromMap({
        'id': '123',
        'number': 1,
        'viability': 80,
        'vigor': 90,
      });

      expect(repetition, isA<RepetitionEntity>());
      expect(repetition.id, '123');
      expect(repetition.number, 1);
      expect(repetition.viability, 80);
      expect(repetition.vigor, 90);
      expect(repetition.interpretations, []);
    });

    test('deve converte repetitionEntity to Map', () {
      final repetition = RepetitionEntity(
          id: '123',
          number: 1,
          viability: 80,
          vigor: 90,
          interpretations: [],
          resultClassication: {},
          resume: ResumeEntity.empty());
      final map = RepetitionMapper.toMap(repetition);

      expect(map['id'], '123');
      expect(map['number'], 1);
      expect(map['viability'], 80);
      expect(map['vigor'], 90);
      expect(map['interpretations'], []);
    });
  });
}
