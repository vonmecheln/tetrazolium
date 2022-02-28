import 'package:tetrazolium/app/modules/analysis/infra/models/analysis_model.dart';

abstract class AnalysisDatasource {
  Future<List<AnalysisModel>?> getAll(int idUser);

  // Future<EventEntity> getByid(String id);
  // Future<bool> addOrUpdate(EventEntity eventEntity);
  // Future<List<EventEntity>> getAll();
  // Future<bool> removeById(String id);
  // Future<Stream<List<EventEntity>>> getStream();
  // Future<String> getLastName();

}
