import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';
import 'package:tetrazolium/app/modules/analysis/infra/repositories/analise_repository_impl.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/number_seeds_entity.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

class IAnalysisDatasourceMock extends Mock implements IAnalysisDatasource {}

void main() {
  final datasource = IAnalysisDatasourceMock();
  final repository = AnalysisRepositoryImpl(datasource);

  group('AnalysisRepository getAnalysisRealtime', () {
    test('deve retornar um Stream de Análises', () async {
      when(() => datasource.getStream())
          .thenAnswer((_) async => Stream.value(<AnalysisEntity>[]));

      final result = await repository.getAnalysisRealtime();

      expect(result.fold(id, id), emits(isA<List<AnalysisEntity>>()));
    });

    test('deve retornar um erro', () async {
      when(() => datasource.getStream()).thenThrow(Exception(''));

      final result = await repository.getAnalysisRealtime();

      expect(result.fold(id, id), isA<DatasourceError>());
    });
  });

  group('AnalysisRepository addNewAnalysis', () {
    final analisys = AnalysisEntity(
      date: DateTime.now(),
      sample: 'sample',
      local: 'local',
      numberSeeds: NumberSeedsEntity.r2s50(),
      concentration: 1,
      viability: 1,
      vigor: 1,
      repetitions: [],
    );

    test('deve retornar uma Análises', () async {
      when(() => datasource.addOrUpdate(analisys))
          .thenAnswer((_) async => true);

      final result = await repository.addNewAnalysis(analisys);

      expect(result.fold(id, id), isA<AnalysisEntity>());
    });

    test('deve retornar um erro', () async {
      when(() => datasource.addOrUpdate(analisys)).thenThrow(Exception(''));

      final result = await repository.addNewAnalysis(analisys);

      expect(result.fold(id, id), isA<DatasourceError>());
    });
  });

  group('AnalysisRepository updateAnalysis', () {
    final analisys = AnalysisEntity(
      date: DateTime.now(),
      sample: 'sample',
      local: 'local',
      numberSeeds: NumberSeedsEntity.r2s50(),
      concentration: 1,
      viability: 1,
      vigor: 1,
      repetitions: [],
    );

    test('deve atualizae uma Análises', () async {
      when(() => datasource.addOrUpdate(analisys))
          .thenAnswer((_) async => true);

      final result = await repository.updateAnalysis(analisys);

      expect(result.fold(id, id), isA<AnalysisEntity>());
    });

    test('deve retornar um erro', () async {
      when(() => datasource.addOrUpdate(analisys)).thenThrow(Exception(''));

      final result = await repository.updateAnalysis(analisys);

      expect(result.fold(id, id), isA<DatasourceError>());
    });
  });
}
