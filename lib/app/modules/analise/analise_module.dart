import 'package:tetrazolium/app/modules/analise/analise_page.dart';
import 'package:tetrazolium/app/modules/analise/analise_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AnaliseModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => AnaliseStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => AnalisePage()),
  ];
}
