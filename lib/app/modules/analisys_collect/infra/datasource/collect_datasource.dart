import 'package:tetrazolium/app/shared/domain/entities/collect_entity.dart';

abstract class ICollectDatasource {
  Future<List<CollectEntity>?> getAll(String id);
}
