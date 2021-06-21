import 'package:dart_login/core/error/failure.dart';
import 'package:dartz/dartz.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

abstract class IConnection {
  Future<Either<Failure, QueryType>> query(String query);
}
