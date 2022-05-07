import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

abstract class ICollectRepository {
  Future<Either<FailureAnalysis, List<CollectEntity>>> getCollects(String id);

  // Future<Either<FailureAnalysis, Analysis>> addNewAnalysis(Analysis analysis);
  // Future<Either<FailureAnalysis, Analysis>> updateAnalysis(Analysis analysis);

  // Future<Stream<List<Analysis>>> getAnalysisRealtime();
}
