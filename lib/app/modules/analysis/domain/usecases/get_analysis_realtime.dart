import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';
import '../repositories/analysis_repository.dart';

part 'get_analysis_realtime.g.dart';

mixin IGetAnalysisRealtime {
  Future<Either<FailureAnalysis, Stream<List<AnalysisEntity>>>> call();
}

@Injectable(singleton: false)
class GetAnalysisRealtime implements IGetAnalysisRealtime {
  final IAnalysisRepository _analysisRepository;

  GetAnalysisRealtime(this._analysisRepository);

  Future<Either<FailureAnalysis, Stream<List<AnalysisEntity>>>> call() async {
    return await _analysisRepository.getAnalysisRealtime();
  }
}
