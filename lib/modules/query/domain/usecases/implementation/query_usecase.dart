import 'package:dart_login/modules/query/domain/repositories/i_query_repository.dart';
import 'package:dart_login/modules/query/domain/usecases/i_query_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

class QueryUsecase extends IQuery {
  IQueryRepository repository;

  QueryUsecase({
    required this.repository,
  });

  @override
  Future<Either<Failure, QueryType>> call(String param) {
    return repository.query(param);
  }
}
