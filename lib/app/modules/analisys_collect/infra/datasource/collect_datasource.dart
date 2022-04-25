import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect.dart';

abstract class ICollectDatasource {
  Future<List<Collect>?> getAll(String id);
}
