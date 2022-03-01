import 'package:dartz/dartz.dart';

import '../errors/erros.dart';
import '../entities/analysis.dart';

abstract class IAnalysisRepository {
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis();

  Future<Either<FailureAnalysis, Analysis>> addNewAnalysis(Analysis analysis);
  Future<Either<FailureAnalysis, Analysis>> updateAnalysis(Analysis analysis);

  Future<Stream<List<Analysis>>> getAnalysisRealtime();
}
