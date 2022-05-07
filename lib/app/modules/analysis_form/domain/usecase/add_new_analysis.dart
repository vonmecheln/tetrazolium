import 'package:dartz/dartz.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';
import 'package:tetrazolium/app/modules/analysis/domain/repositories/analysis_repository.dart';

part 'add_new_analysis.g.dart';

abstract class IAddNewAnalysis {
  Future<Either<FailureAnalysis, AnalysisEntity>> call(AnalysisEntity analysis);
}

@Injectable()
class AddNewAnalysis extends IAddNewAnalysis {
  final IAnalysisRepository _analysisRepository;

  AddNewAnalysis(this._analysisRepository);

  @override
  Future<Either<FailureAnalysis, AnalysisEntity>> call(
      AnalysisEntity analysis) async {
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
