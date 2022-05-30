import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/get_analysis_realtime.dart';
import 'package:tetrazolium/app/modules/analysis/infra/repositories/analise_repository_impl.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/pages/details_page.dart';
import 'package:tetrazolium/app/modules/analysis/presenter/stores/list_store.dart';
import 'package:tetrazolium/app/shared/external/datasource/analysis_datasource_impl.dart';
import 'presenter/pages/list_page.dart';

class AnalysisModule extends Module {
  @override
  final List<Bind> binds = [
    $ListStore,
    $GetAnalysisRealtime,
    BindInject<IGetAnalysisRealtime>((i) => GetAnalysisRealtimeFake()),
    $AnalysisRepositoryImpl,
    $AnalysisDatasourceImpl,
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, __) => const ListaPage()),
    ChildRoute('/details',
        child: (_, args) => DetailsPage(analysis: args.data)),
  ];
}
