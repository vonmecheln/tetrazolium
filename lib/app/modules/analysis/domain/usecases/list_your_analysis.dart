import 'package:dartz/dartz.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/errors/erros.dart';
import '../../domain/repositories/analysis_repository.dart';

mixin ListarSuasAnalises {
  Future<Either<FailureAnalysis, List<Analysis>>> call(int idUser);
}

// @Injectable(singleton: false)
class ListarSuasAnalisesImpl implements ListarSuasAnalises {
  final AnalysisRepository repository;

  ListarSuasAnalisesImpl(this.repository);

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> call(int idUser) async {
    var option = optionOf(idUser);

    return option.fold(() => Left(InvalidIdUser()), (id) async {
      var result = await repository.getAnalysis(id);
      return result.fold(
          (l) => left(l), (r) => r.isEmpty ? left(EmptyList()) : right(r));
    });
  }
}
