import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';

part 'lista_store.g.dart';

@Injectable()
class ListStore extends MobXStore<FailureAnalysis, List<Object>> {
  // final ListByText ListByText;

  ListStore() : super([]);

  void setSearchText(String value) {
    //executeEither(() => searchByText(value), delay: Duration(milliseconds: 500));
  }
}
