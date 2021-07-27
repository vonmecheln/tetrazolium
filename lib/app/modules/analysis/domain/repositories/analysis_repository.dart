import 'package:dartz/dartz.dart';

import '../errors/erros.dart';
import '../entities/analysis.dart';

abstract class AnalysisRepository {
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis(int idUser);
}
