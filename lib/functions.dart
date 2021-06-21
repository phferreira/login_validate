import 'package:dart_login/modules/connection/domain/usecases/implementation/postgres_connection.dart';
import 'package:dart_login/modules/query/domain/usecases/implementation/query_usecase.dart';
import 'package:dart_login/modules/query/external/datasources/query_datasource.dart';
import 'package:dart_login/modules/query/infrastructure/repositories/query_repository.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

@CloudFunction()
Future<Response> function(Request request) async {
  final usecase = QueryUsecase(repository: QueryRepository(dataSource: QueryDataSource(connection: PostgresConnection())));

  var result = await usecase('select 2 from pg_catalog.pg_stat_activity limit 2;');

  return Response.ok(result.toString());
}
