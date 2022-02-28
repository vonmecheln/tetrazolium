import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/modules/analysis/domain/errors/erros.dart';
import 'package:tetrazolium/app/modules/analysis/domain/entities/analysis.dart';
import 'package:tetrazolium/app/modules/analysis/domain/repositories/analysis_repository.dart';
import 'package:tetrazolium/app/modules/analysis/external/firebase/base_firebase_data_source.dart';
import 'package:tetrazolium/app/modules/analysis/infra/mappers/analysis_data_mapper.dart';

class AnalysisFirebaseDataSource extends BaseFirebaseDataSource
    implements AnalysisRepository {
  static const String path = 'analysis';

  @override
  Future<Either<FailureAnalysis, List<Analysis>>> getAnalysis(int idUser) {
    getCollection(path)
        .snapshots()
        .map(
            (snapshot) => snapshot.docs.map(AnalysisDataMapper.mapper).toList())
        .first;

    // TODO: implement getAnalysis
    throw UnimplementedError();
  }
//

//   @override
//   Future<List<Voucher>> getAll() {
//     return getCollection(path).snapshots().map((snapshot) =>
//         snapshot.documents.map(VoucherDataMapper.mapper).toList()).first;
//   }
}
