import 'package:dartz/dartz.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/errors/erros.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../../infra/datasources/search_datasource.dart';
import '../../infra/models/analysis_model.dart';

class AnalysisRepositoryImpl implements AnalysisRepository {
  final SearchDatasource datasource;

  AnalysisRepositoryImpl(this.datasource);

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis(
      int idUser) async {
    List<AnalysisModel> list;

    try {
      list = await datasource.listAnalise(idUser);
    } catch (e) {
      return left(ErrorList());
    }

    return list == null ? left(DatasourceResultNull()) : right(list);
  }
}
