import 'package:flutter_modular/flutter_modular.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/external/datasource/datasource.dart';
import 'package:tetrazolium/app/modules/analysis/external/mappers/analysis_data_mapper.dart';
import 'package:tetrazolium/app/modules/analysis/infra/datasource/analysis_datasource.dart';

part 'analysis_datasource_impl.g.dart';

@Injectable()
class AnalysisDatasourceImpl extends Datasource<Analysis>
    with AnalysisMapper
    implements IAnalysisDatasource {
  AnalysisDatasourceImpl() : super('analises');
}
