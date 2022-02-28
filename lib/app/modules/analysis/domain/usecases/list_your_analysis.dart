import 'package:dartz/dartz.dart';
import 'package:mobx_triple/mobx_triple.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/errors/erros.dart';
import '../../domain/repositories/analysis_repository.dart';

class CustomEitherAdapter<R, L> implements EitherAdapter<R, L> {
  final Either<R, L> usecase;
  CustomEitherAdapter(this.usecase);

  @override
  T fold<T>(T Function(R l) leftF, T Function(L l) rightF) {
    return usecase.fold(leftF, rightF);
  }

  static Future<EitherAdapter<L, R>> adapter<L, R>(
      Future<Either<L, R>> usecase) {
    return usecase.then((value) => CustomEitherAdapter(value));
  }
}

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
