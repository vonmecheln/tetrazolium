import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/get_analysis_realtime.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/list_your_analysis.dart';

part 'list_store.g.dart';

@Injectable()
class ListStore extends MobXStore<FailureAnalysis, List<Analysis>> {
  // final ListYourAnalysis listYourAnalysis;
  final GetAnalysisRealtime _getEventsRealtime;

  ListStore(this._getEventsRealtime) : super([]);

  void reloadData() async => executeStream(await _getEventsRealtime());
}
