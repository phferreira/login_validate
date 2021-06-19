import 'package:dart_login/core/error/failure.dart';

class InvalidUserPassword implements Failure {
  @override
  final String message;

  InvalidUserPassword([this.message = '']);
}
