import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:dartz/dartz.dart';

import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';
import 'package:tetrazolium/app/modules/analysis/infra/repositories/analise_repository_impl.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';

class IAnalysisDatasourceMock extends Mock implements IAnalysisDatasource {}

void main() {
  final datasource = IAnalysisDatasourceMock();
  final repository = AnalysisRepositoryImpl(datasource);

  test('deve retornar um Stream de Análises', () async {
    when(() => datasource.getStream())
        .thenAnswer((_) async => Stream.value(<AnalysisEntity>[]));

    final result = await repository.getAnalysisRealtime();

    expect(result.fold(id, id), emits(isA<List<AnalysisEntity>>()));
  });

  test('deve retornar um erro por id inválido', () async {});
}
