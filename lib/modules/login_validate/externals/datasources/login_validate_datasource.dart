import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/login_validate/domain/errors/failures.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/login_validate_datasource.dart';
import 'package:dartz/dartz.dart';

class LoginValidateDataSource extends ILoginValidateDataSource {
  @override
  Future<Either<Failure, JsonType>> loginValidate(JsonType param) async {
    try {
      final result = {
        'userName': 'teste',
        'password': '12345',
      };
      return Right(result);
    } catch (e) {
      return left(DataSourceError());
    }
  }
}
