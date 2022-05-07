import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/repositories/collect_repository.dart';
import 'package:tetrazolium/app/modules/analisys_collect/infra/datasource/collect_datasource.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

part 'collect_repository_impl.g.dart';

@Injectable(singleton: false)
class AnalysisRepositoryImpl implements ICollectRepository {
  final ICollectDatasource _datasource;

  AnalysisRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureAnalysis, List<CollectEntity>>> getCollects(
      String id) async {
    try {
      final list = await _datasource.getAll(id);
      return list == null
          ? Left<FailureAnalysis, List<CollectEntity>>(
              DatasourceResultNull(message: ''))
          : Right<FailureAnalysis, List<CollectEntity>>(list);
    } catch (e) {
      return Left<FailureAnalysis, List<CollectEntity>>(ErrorList(message: ''));
    }
  }
}
