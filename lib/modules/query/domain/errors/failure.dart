import 'package:dart_login/core/error/failure.dart';

class QueryError implements Failure {
  @override
  final String message;

  QueryError([this.message = '']);
}
