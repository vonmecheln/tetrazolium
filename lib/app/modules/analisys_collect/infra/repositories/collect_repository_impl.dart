import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/collect.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/repositories/collect_repository.dart';
import 'package:tetrazolium/app/modules/analisys_collect/infra/datasource/collect_datasource.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

part 'collect_repository_impl.g.dart';

@Injectable(singleton: false)
class AnalysisRepositoryImpl implements ICollectRepository {
  final ICollectDatasource _datasource;

  AnalysisRepositoryImpl(this._datasource);

  @override
  Future<Either<FailureAnalysis, List<Collect>>> getCollects(String id) async {
    try {
      final list = await _datasource.getAll(id);
      return list == null
          ? Left<FailureAnalysis, List<Collect>>(
              DatasourceResultNull(message: ''))
          : Right<FailureAnalysis, List<Collect>>(list);
    } catch (e) {
      return Left<FailureAnalysis, List<Collect>>(ErrorList(message: ''));
    }
  }
}
