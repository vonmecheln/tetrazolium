import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect_entity.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/repositories/collect_repository.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

part 'get_collects.g.dart';

mixin GetCollects {
  Future<Either<FailureAnalysis, List<CollectEntity>>> call(String id);
}

@Injectable(singleton: false)
class GetCollectsImpl implements GetCollects {
  final ICollectRepository repository;

  GetCollectsImpl(this.repository);

  @override
  Future<Either<FailureAnalysis, List<CollectEntity>>> call(String id) async {
    var option = optionOf(id);

    return option.fold(() => Left(InvalidAnalysis(message: '')), (id) async {
      var result = await repository.getCollects(id);
      return result.fold((l) => left(l),
          (r) => r.isEmpty ? left(EmptyList(message: '')) : right(r));
    });
  }
}
