import 'package:tetrazolium/app/shared/domain/entities/collect.dart';

abstract class ICollectDatasource {
  Future<List<Collect>?> getAll(String id);
}
