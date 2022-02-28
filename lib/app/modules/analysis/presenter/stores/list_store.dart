import 'package:flutter_modular/flutter_modular.dart';
import 'package:mobx_triple/mobx_triple.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';
import 'package:tetrazolium/app/modules/analysis/domain/usecases/list_your_analysis.dart';

part 'list_store.g.dart';

@Injectable()
class ListStore extends MobXStore<FailureAnalysis, List<Analysis>> {
  final ListarSuasAnalises listByText;

  ListStore(this.listByText) : super([]);

  void setSearchText(int value) {
    executeEither(
      () => CustomEitherAdapter.adapter(listByText(value)),
      delay: Duration(milliseconds: 500),
    );
  }
}
