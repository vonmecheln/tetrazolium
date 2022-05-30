import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis/infra/repositories/analise_repository_impl.dart';
import 'package:tetrazolium/app/modules/analysis_form/presenter/pages/add_analysis_page.dart';
import 'package:tetrazolium/app/modules/analysis_form/presenter/controllers/add_analysis_controller.dart';
import 'package:tetrazolium/app/modules/analysis_form/domain/usecase/add_new_analysis.dart';
import 'package:tetrazolium/app/shared/external/datasource/analysis_datasource_impl.dart';

class AnalysisFormModule extends Module {
  @override
  final List<Bind> binds = [
    $AddAnalysisController,
    $AddNewAnalysis,
    $AnalysisRepositoryImpl,
    $AnalysisDatasourceImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/new', child: (_, __) => const AddAnalysisPage()),
  ];
}
