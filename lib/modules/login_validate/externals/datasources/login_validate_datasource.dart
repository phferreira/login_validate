import 'dart:async';
import 'dart:convert';
import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/connection/domain/errors/failure.dart';
import 'package:dart_login/modules/connection/domain/usecases/implementation/postgres_connection.dart';
import 'package:dart_login/modules/login_validate/domain/errors/failures.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/i_login_validate_datasource.dart';
import 'package:dart_login/modules/query/domain/usecases/implementation/query_usecase.dart';
import 'package:dart_login/modules/query/external/datasources/query_datasource.dart';
import 'package:dart_login/modules/query/infrastructure/repositories/query_repository.dart';
import 'package:dartz/dartz.dart';

class LoginValidateDataSource extends ILoginValidateDataSource {
  final queryUsecase = QueryUsecase(repository: QueryRepository(dataSource: QueryDataSource(connection: PostgresConnection())));

  @override
  Future<Either<Failure, JsonResultType>> loginValidate(JsonType param) async {
    try {
      final jsonParam = (jsonDecode(utf8.decode(base64Decode(param))));
      final username = jsonParam['username'];
      final password = jsonParam['password'];
      final sql = '''
           select id_codigo as id, tx_role as role
             from tb_usuario
            where tx_username = \'$username\'
              and tx_password = \'$password\'
            limit 1;
        ''';

      return (await queryUsecase(sql)).fold((l) {
        return Left(l);
      }, (r) {
        return Right(r.first['tb_usuario']);
      });
    } on PostgresQueryError catch (e) {
      return Left(DataSourceError(e.message));
    } on PostgresNotFoundError catch (e) {
      return Left(NotFoundError(e.message));
    } catch (e) {
      return Left(LoginValidateError('Login validate error'));
    }
  }
}
