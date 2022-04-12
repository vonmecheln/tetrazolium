import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

import '../../domain/entities/analysis.dart';
import '../../domain/repositories/analysis_repository.dart';

part 'list_your_analysis.g.dart';

mixin ListYourAnalysis {
  Future<Either<FailureAnalysis, List<Analysis>>> call(int idUser);
}

@Injectable(singleton: false)
class ListYourAnalysisImpl implements ListYourAnalysis {
  final IAnalysisRepository repository;

  ListYourAnalysisImpl(this.repository);

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> call(int idUser) async {
    var option = optionOf(idUser);

    return option.fold(() => Left(InvalidIdUser(message: '')), (id) async {
      var result = await repository.getAnalysis();
      return result.fold((l) => left(l),
          (r) => r.isEmpty ? left(EmptyList(message: '')) : right(r));
    });
  }
}

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
