import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';

abstract class IAnalysisDatasource {
  // Future<List<Analysis>?> getAll(int idUser);

  // Future<Analysis> getByid(String id);
  Future<bool> addOrUpdate(Analysis entity);
  Future<List<Analysis>> getAll();
  // Future<bool> removeById(String id);
  Future<Stream<List<Analysis>>> getStream();

  // Future<String> getLastName();

}
