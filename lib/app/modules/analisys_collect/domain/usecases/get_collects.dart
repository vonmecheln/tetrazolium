import 'package:dartz/dartz.dart';
import 'package:tetrazolium/app/modules/analisys_collect/domain/entities/collect.dart';
import 'package:tetrazolium/app/shared/domain/errors/errors.dart';

mixin GetCollects {
  Future<Either<FailureAnalysis, List<Collect>>> call(String id);
}
