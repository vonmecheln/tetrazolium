import 'package:flutter_modular/flutter_modular.dart';
import '../datasources/search_datasource.dart';
import '../models/analysis_model.dart';

part 'analysis_search_datasource_impl.g.dart';

@Injectable()
class AnalysisSearchDatasourceImpl extends SearchDatasource {
  @override
  Future<List<AnalysisModel>> listAnalise(int idUser) async {
    // TODO: implement listAnalise
    List<AnalysisModel> list = [];
    for (var i = 0; i < 10; i++) {
      list.add(AnalysisModel(
        amostra: "tesrw",
        concentration: 0.75,
        date: DateTime.now(),
        local: "Embrapa",
        viability: 60,
        vigor: 70,
      ));
    }

    return list;
  }
}
