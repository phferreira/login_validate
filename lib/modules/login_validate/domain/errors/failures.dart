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

class NotFoundError implements Failure {
  @override
  final String message;

  NotFoundError([this.message = '']);
}

class LoginValidateError implements Failure {
  @override
  final String message;

  LoginValidateError([this.message = '']);
}
