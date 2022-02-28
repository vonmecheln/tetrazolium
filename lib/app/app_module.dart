import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis/analysis_module.dart';
import 'package:tetrazolium/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    ModuleRoute('/home', module: AnalysisModule()),
    // ModuleRoute('/novo', module: AnaliseModule()),
    // ModuleRoute('/analise', module: AnaliseModule()),
  ];
}
