import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/get_analysis_realtime.dart';

part 'list_store.g.dart';

@Injectable()
class ListStore extends MobXStore<FailureAnalysis, List<Analysis>> {
  final GetAnalysisRealtime _getAnalysisRealtime;

  ListStore(this._getAnalysisRealtime) : super([]);

  void reloadData() async => executeStream(await _getAnalysisRealtime());
}
