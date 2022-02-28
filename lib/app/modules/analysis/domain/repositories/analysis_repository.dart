import 'package:dartz/dartz.dart';

import '../errors/erros.dart';
import '../entities/analysis.dart';

abstract class IAnalysisRepository {
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis();

  Future<Stream<List<Analysis>>> getEventsRealtime();
}
