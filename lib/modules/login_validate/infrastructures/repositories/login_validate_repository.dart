import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/modules/login_validate/domain/repositories/login_validate_repository.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/i_get_token_datasource.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/i_login_validate_datasource.dart';

class LoginValidateRepository extends ILoginValidateRepository {
  ILoginValidateDataSource datasource;
  IGetTokenDatasource getToken;

  LoginValidateRepository({
    required this.datasource,
    required this.getToken,
  });

  @override
  Future<Either<Failure, ResultType>> loginValidate(JsonType param) async {
    return (await datasource.loginValidate(param)).fold(
      (l) => Left(l),
      (r) async {
        return (await getToken.getToken(r)).fold(
          (l) => Left(l),
          (r) => Right(base64Encode(r.codeUnits)),
        );
      },
    );
  }
}
