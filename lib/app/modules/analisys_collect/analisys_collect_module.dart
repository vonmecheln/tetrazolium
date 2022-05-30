import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analisys_collect/presenter/pages/collect/repetition_page.dart';

class AnalisysCollectModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => const RepetitionPage()),
  ];
}
