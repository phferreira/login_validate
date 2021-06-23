import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/usecase/usecase.dart';
import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dartz/dartz.dart';

abstract class ILoginValidateUseCase extends IUseCase<JsonResultType, JsonType> {
  @override
  Future<Either<Failure, JsonResultType>> call(JsonType param);
}
