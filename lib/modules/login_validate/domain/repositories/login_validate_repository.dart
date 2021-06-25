import 'package:dart_login/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/utils/types/json_types.dart';

abstract class ILoginValidateRepository {
  Future<Either<Failure, JsonType>> loginValidate(JsonType param);
}
