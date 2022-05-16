import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analisys_collect/analisysCollect_module.dart';
import 'package:tetrazolium/app/modules/analysis/analysis_module.dart';
import 'package:tetrazolium/app/modules/analysis_form/analisys_form_module.dart';
import 'package:tetrazolium/app/modules/login/login_module.dart';
import 'package:tetrazolium/app/modules/splash/splash_module.dart';
// import 'package:tetrazolium/app/modules/splash/splash_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => FirebaseFirestore.instance),
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: SplashModule()),
    // ModuleRoute(Modular.initialRoute, module: AnalisysCollectModule()),
    ModuleRoute('/home', module: AnalysisModule()),
    ModuleRoute('/form', module: AnalysisFormModule()),
    ModuleRoute('/login', module: LoginModule()),
    ModuleRoute('/collect', module: AnalisysCollectModule()),
  ];
}
