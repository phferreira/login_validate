import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

abstract class IQuery extends IUseCase<QueryType, String> {
  @override
  Future<Either<Failure, QueryType>> call(String param);
}
