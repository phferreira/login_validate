import 'package:dart_login/modules/connection/domain/usecases/i_connection_usecase.dart';
import 'package:dart_login/modules/query/domain/errors/failure.dart';
import 'package:dart_login/modules/query/infrastructure/datasources/i_query_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

class QueryDataSource extends IQueryDataSource {
  IConnection connection;

  QueryDataSource({
    required this.connection,
  });

  @override
  Future<Either<Failure, QueryType>> query(String query) async {
    try {
      return connection.query(query);
    } catch (e) {
      return Left(QueryError());
    }
  }
}
