import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/novo/novo_page.dart';

class NovoModule extends Module {
  @override
  final List<Bind> binds = [
    // Bind.lazySingleton((i) => HomeStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => NovoPage()),
  ];
}
