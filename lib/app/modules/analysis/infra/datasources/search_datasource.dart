import 'package:tetrazolium/app/modules/analysis/infra/models/analysis_model.dart';

abstract class SearchDatasource {
  Future<List<AnalysisModel>> listAnalise(int idUser);
}
