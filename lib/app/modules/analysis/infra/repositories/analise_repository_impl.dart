import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/errors/erros.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../../infra/datasources/search_datasource.dart';

part 'analise_repository_impl.g.dart';

@Injectable(singleton: false)
class AnalysisRepositoryImpl implements AnalysisRepository {
  final SearchDatasource datasource;

  AnalysisRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis(
    int idUser,
  ) async {
    try {
      final list = await datasource.listAnalise(idUser);
      return list == null
          ? Left<FailureAnalysis, List<Analysis>>(DatasourceResultNull())
          : Right<FailureAnalysis, List<Analysis>>(list);
    } catch (e) {
      return Left<FailureAnalysis, List<Analysis>>(ErrorList());
    }
  }
}
