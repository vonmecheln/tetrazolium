import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/modules/login/domain/errors/errors.dart';

abstract class IConnectivityService {
  Future<Either<Failure, Unit>> isOnline();
}
