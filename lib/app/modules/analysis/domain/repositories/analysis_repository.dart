import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/shared/domain/entities/index.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

abstract class IAnalysisRepository {
  Future<Either<FailureAnalysis, List<AnalysisEntity>>> getAnalysis();

  Future<Either<FailureAnalysis, AnalysisEntity>> addNewAnalysis(
    AnalysisEntity analysis,
  );
  Future<Either<FailureAnalysis, AnalysisEntity>> updateAnalysis(
    AnalysisEntity analysis,
  );

  Future<Either<FailureAnalysis, Stream<List<AnalysisEntity>>>>
      getAnalysisRealtime();
}
