import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/errors/erros.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../datasource/analysis_datasource.dart';

part 'analise_repository_impl.g.dart';

@Injectable(singleton: false)
class AnalysisRepositoryImpl implements IAnalysisRepository {
  final IAnalysisDatasource _datasource;

  AnalysisRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis() async {
    try {
      final list = await _datasource.getAll();
      return list == null
          ? Left<FailureAnalysis, List<Analysis>>(DatasourceResultNull())
          : Right<FailureAnalysis, List<Analysis>>(list);
    } catch (e) {
      return Left<FailureAnalysis, List<Analysis>>(ErrorList());
    }
  }

  @override
  Future<Stream<List<Analysis>>> getEventsRealtime() async {
    return await _datasource.getStream();
  }
}
