import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';

import '../repositories/analysis_repository.dart';

class GetAnalysisRealtime {
  final IAnalysisRepository _eventRepository;

  GetAnalysisRealtime(this._eventRepository);

  Future<Stream<List<Analysis>>> call() async {
    return await _eventRepository.getEventsRealtime();
  }
}
