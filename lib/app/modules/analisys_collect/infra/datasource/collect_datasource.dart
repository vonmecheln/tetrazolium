import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';

abstract class ICollectDatasource {
  Future<List<CollectEntity>?> getAll(String id);
}
