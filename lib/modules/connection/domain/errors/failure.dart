import 'package:dart_login/core/error/failure.dart';

class PostgresQueryError implements Failure {
  @override
  final String message;

  PostgresQueryError([this.message = '']);
}

class PostgresConnectionError implements Failure {
  @override
  final String message;

  PostgresConnectionError([this.message = '']);
}

class PostgresNotFoundError implements Failure {
  @override
  final String message;

  PostgresNotFoundError([this.message = '']);
}

class PostgresError implements Failure {
  @override
  final String message;

  PostgresError([this.message = '']);
}
