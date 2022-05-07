import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

import '../../../../shared/domain/entities/analysis_entity.dart';
import '../../domain/repositories/analysis_repository.dart';
import '../datasource/analysis_datasource.dart';

part 'analise_repository_impl.g.dart';

@Injectable(singleton: false)
class AnalysisRepositoryImpl implements IAnalysisRepository {
  final IAnalysisDatasource _datasource;

  AnalysisRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureAnalysis, List<AnalysisEntity>>> getAnalysis() async {
    try {
      final list = await _datasource.getAll();
      return list == null
          ? Left<FailureAnalysis, List<AnalysisEntity>>(
              DatasourceResultNull(message: ''))
          : Right<FailureAnalysis, List<AnalysisEntity>>(list);
    } catch (e) {
      return Left<FailureAnalysis, List<AnalysisEntity>>(
          ErrorList(message: ''));
    }
  }

  @override
  Future<Stream<List<AnalysisEntity>>> getAnalysisRealtime() async {
    return await _datasource.getStream();
  }

  @override
  Future<Either<FailureAnalysis, AnalysisEntity>> addNewAnalysis(
      AnalysisEntity analysis) async {
    try {
      await _datasource.addOrUpdate(analysis);
      return Right(analysis);
    } catch (e) {
      return Left(DatasourceError(message: e.toString()));
    }
  }

  @override
  Future<Either<FailureAnalysis, AnalysisEntity>> updateAnalysis(
      AnalysisEntity analysis) {
    // TODO: implement updateAnalysis
    throw UnimplementedError();
  }
}
