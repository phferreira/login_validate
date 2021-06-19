import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/domain/repository/login_validate_repository.dart';
import 'package:dart_login/domain/usecases/login_validate_usecase.dart';

class LoginValidateUseCase extends ILoginValidateUseCase {
  ILoginValidateRepository repository;

  LoginValidateUseCase({
    required this.repository,
  });

  @override
  Future<Either<Failure, JsonType>> call(JsonType param) {
    return repository.loginValidate(param);
  }
}
