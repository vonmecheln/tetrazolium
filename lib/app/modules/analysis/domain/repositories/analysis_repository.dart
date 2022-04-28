import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

import '../../../../shared/domain/entities/analysis.dart';

abstract class IAnalysisRepository {
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis();

  Future<Either<FailureAnalysis, Analysis>> addNewAnalysis(Analysis analysis);
  Future<Either<FailureAnalysis, Analysis>> updateAnalysis(Analysis analysis);

  Future<Stream<List<Analysis>>> getAnalysisRealtime();
}
