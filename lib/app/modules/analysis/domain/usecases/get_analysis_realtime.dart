import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis.dart';
import '../repositories/analysis_repository.dart';

part 'get_analysis_realtime.g.dart';

@Injectable(singleton: false)
class GetAnalysisRealtime {
  final IAnalysisRepository _analysisRepository;

  GetAnalysisRealtime(this._analysisRepository);

  Future<Stream<List<AnalysisEntity>>> call() async {
    return await _analysisRepository.getAnalysisRealtime();
  }
}
