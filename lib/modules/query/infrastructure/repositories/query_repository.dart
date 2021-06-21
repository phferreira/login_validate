import 'package:dart_login/modules/query/domain/repositories/i_query_repository.dart';
import 'package:dart_login/modules/query/infrastructure/datasources/i_query_datasource.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

class QueryRepository extends IQueryRepository {
  IQueryDataSource dataSource;

  QueryRepository({
    required this.dataSource,
  });

  @override
  Future<Either<Failure, QueryType>> query(String query) {
    return dataSource.query(query);
  }
}
