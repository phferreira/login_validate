import 'package:dart_login/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/utils/types/json_types.dart';

abstract class IGetTokenDatasource {
  Future<Either<Failure, ResultType>> getToken(JsonResultType param);
}
