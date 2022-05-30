import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_triple/flutter_triple.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/get_analysis_realtime.dart';

part 'list_store.g.dart';

@Injectable()
class ListStore
    extends StreamStore<FailureAnalysis, Stream<List<AnalysisEntity>>> {
  final GetAnalysisRealtime _getAnalysisRealtime;

  ListStore(this._getAnalysisRealtime) : super(const Stream.empty());

  void reloadData() async {
    // executeStream(await _getAnalysisRealtime());
    // executeEither(() => _getAnalysisRealtime());

    executeEither(() => CustomEitherAdapter.adapter(_getAnalysisRealtime()));
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
    Future<Either<L, R>> usecase,
  ) {
    return usecase.then((value) => CustomEitherAdapter(value));
  }
}
