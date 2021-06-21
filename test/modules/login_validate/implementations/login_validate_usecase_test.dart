import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/login_validate/domain/errors/failures.dart';
import 'package:dart_login/modules/login_validate/domain/repositories/login_validate_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../../utils/json_login.dart';

class LoginValidateRepositoryMock extends Mock implements ILoginValidateRepository {}

void main() {
  final repository = LoginValidateRepositoryMock();

  test('Must be return a json to response', () async {
    when(() => repository.loginValidate(any())).thenAnswer((_) async => Right(jsonResponse));
    final result = await repository.loginValidate(jsonLogin);
    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, JsonType>>());
    verify(() => repository.loginValidate(any()));
  });

  test('Must be return a failure', () async {
    when(() => repository.loginValidate(any())).thenAnswer((_) async => Left(InvalidUserPassword()));
    final result = await repository.loginValidate(jsonLogin);
    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, JsonType>>());
    verify(() => repository.loginValidate(any()));
  });
}
