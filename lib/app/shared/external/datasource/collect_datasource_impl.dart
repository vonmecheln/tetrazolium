import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect.dart';
import 'package:tetrazolium/app/modules/analisys_collect/infra/datasource/collect_datasource.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource2.dart';
import 'package:tetrazolium/app/shared/external/mappers/collect_data_mapper.dart';

part 'collect_datasource_impl.g.dart';

@Injectable()
class CollectDatasourceImpl extends Datasource2<Collect>
    with CollectMapper
    implements ICollectDatasource {
  CollectDatasourceImpl(FirebaseFirestore firestore)
      : super('colects', firestore);
}
