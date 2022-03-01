import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';
import 'package:tetrazolium/app/modules/analysis/domain/repositories/analysis_repository.dart';

part 'add_new_analysis.g.dart';

abstract class IAddNewAnalysis {
  Future<Either<FailureAnalysis, Analysis>> call(Analysis analysis);
}

@Injectable()
class AddNewAnalysis extends IAddNewAnalysis {
  final IAnalysisRepository _analysisRepository;

  AddNewAnalysis(this._analysisRepository);

  @override
  Future<Either<FailureAnalysis, Analysis>> call(Analysis analysis) async {
    // assert(analysis.id == null);

    if (analysis.local.trim().length == 0) {
      return Left(
        InvalidAnalysis(
          message: "Local da análise deve ser informado.",
        ),
      );
    }

    return await _analysisRepository.addNewAnalysis(analysis);
  }
}
