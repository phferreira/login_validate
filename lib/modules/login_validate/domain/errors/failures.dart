import 'package:dart_login/core/error/failure.dart';

class InvalidUserPassword implements Failure {
  @override
  final String message;

  InvalidUserPassword([this.message = '']);
}

class DataSourceError implements Failure {
  @override
  final String message;

  DataSourceError([this.message = '']);
}
