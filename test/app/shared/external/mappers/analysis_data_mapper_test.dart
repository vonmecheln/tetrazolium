import 'package:flutter_test/flutter_test.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/repetition_entity.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';

class AnalysisMapperMock with AnalysisMapper {}

void main() {
  AnalysisMapperMock mapper = AnalysisMapperMock();
  final date = DateTime.now();

  group('analysis data mapper ...', () {
    test('deve converter um map em um objeto do tipo AnalysisEntity', () {
      final analysis = mapper.fromMap({
        'id': '123456789',
        'date': date.millisecondsSinceEpoch,
        'sample': 'sample',
        'local': 'local',
        'concentration': 0.75,
        'numberSeeds': '2x50',
        'viability': 80,
        'vigor': 80,
      });

      expect(analysis, isA<AnalysisEntity>());
      expect(
        analysis.date,
        DateTime.fromMillisecondsSinceEpoch(date.millisecondsSinceEpoch),
      );
      expect(analysis.sample, 'sample');
      expect(analysis.local, 'local');
      expect(analysis.concentration, 0.75);
      expect(analysis.numberSeeds, '2x50');
      expect(analysis.viability, 80);
      expect(analysis.vigor, 80);
      expect(analysis.repetition, isA<List<RepetitionEntity>>());

      // expect(queue.orders.first.status, OrderStatus.attending);
    });

    test('deve converte AnalysisEntity to Map', () {
      final analysis = AnalysisEntity(
        date: date,
        sample: 'sample',
        local: 'local',
        concentration: 0.75,
        numberSeeds: '2x50',
        viability: 80,
        vigor: 80,
      );

      final map = mapper.toMap(analysis);

      expect(map['date'], date.millisecondsSinceEpoch);
      expect(map['sample'], 'sample');
      expect(map['local'], 'local');
      expect(map['concentration'], 0.75);
      expect(map['numberSeeds'], '2x50');
      expect(map['viability'], 80);
      expect(map['vigor'], 80);
      expect(map['repetition'], []);
    });
  });
}
