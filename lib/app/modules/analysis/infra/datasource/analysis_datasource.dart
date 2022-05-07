import 'package:tetrazolium/app/shared/domain/entities/analysis.dart';

abstract class IAnalysisDatasource {
  // Future<List<Analysis>?> getAll(int idUser);

  // Future<Analysis> getByid(String id);
  Future<bool> addOrUpdate(AnalysisEntity entity);
  Future<List<AnalysisEntity>> getAll();
  // Future<bool> removeById(String id);
  Future<Stream<List<AnalysisEntity>>> getStream();

  // Future<String> getLastName();

}
