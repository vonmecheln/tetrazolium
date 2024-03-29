import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/shared/domain/entities/analysis_entity.dart';
import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';
import 'package:tetrazolium/app/shared/external/collections.dart';
import 'package:tetrazolium/app/shared/external/datasource/datasource.dart';
import 'package:tetrazolium/app/shared/external/mappers/analysis_data_mapper.dart';

part 'analysis_datasource_impl.g.dart';

@Injectable()
class AnalysisDatasourceImpl extends Datasource<AnalysisEntity>
    with AnalysisMapperMixin
    implements IAnalysisDatasource {
  AnalysisDatasourceImpl(FirebaseFirestore firestore)
      : super(ANALYSIS, firestore);
}
