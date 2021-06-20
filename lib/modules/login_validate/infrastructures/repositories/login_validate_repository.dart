import 'package:dart_login/modules/login_validate/domain/repositories/login_validate_repository.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/login_validate_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/json_types.dart';

class LoginValidateRepository extends ILoginValidateRepository {
  ILoginValidateDataSource datasource;

  LoginValidateRepository({
    required this.datasource,
  });

  @override
  Future<Either<Failure, JsonType>> loginValidate(JsonType param) async {
    return await datasource.loginValidate(param);
  }
}
