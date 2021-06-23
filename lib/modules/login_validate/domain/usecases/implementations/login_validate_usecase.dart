import 'package:dart_login/modules/login_validate/domain/repositories/login_validate_repository.dart';
import 'package:dart_login/modules/login_validate/domain/usecases/login_validate_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/json_types.dart';

class LoginValidateUseCase extends ILoginValidateUseCase {
  ILoginValidateRepository repository;

  LoginValidateUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, JsonResultType>> call(JsonType param) {
    return repository.loginValidate(param);
  }
}
