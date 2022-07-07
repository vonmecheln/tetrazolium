import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/entities/number_seeds_entity.dart';
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

  @override
  Future<Either<FailureAnalysis, Stream<List<AnalysisEntity>>>> call() async {
    return await _analysisRepository.getAnalysisRealtime();
  }
}

class GetAnalysisRealtimeFake implements IGetAnalysisRealtime {
  GetAnalysisRealtimeFake();

  @override
  Future<Either<FailureAnalysis, Stream<List<AnalysisEntity>>>> call() async {
    final model = AnalysisEntity(
      date: DateTime.now(),
      sample: 'sample',
      local: 'local',
      numberSeeds: NumberSeedsEntity.r2s50(),
      concentration: 0.75,
      viability: 80,
      vigor: 90,
      repetitions: [],
      u: '',
    );

    return Future.delayed(const Duration(seconds: 3)).then(
      (_) => right(
        Stream.value(
          <AnalysisEntity>[
            model.copyWith(),
            model.copyWith(),
          ],
        ),
      ),
    );
  }
}
