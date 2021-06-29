import 'dart:convert';
import 'package:dart_login/modules/login_validate/domain/usecases/implementations/login_validate_usecase.dart';
import 'package:dart_login/modules/login_validate/externals/datasources/get_token_datasource.dart';
import 'package:dart_login/modules/login_validate/externals/datasources/login_validate_datasource.dart';
import 'package:dart_login/modules/login_validate/infrastructures/repositories/login_validate_repository.dart';
import 'package:functions_framework/functions_framework.dart';
import 'package:shelf/shelf.dart';

final usecase = LoginValidateUseCase(
  repository: LoginValidateRepository(
    datasource: LoginValidateDataSource(),
    getToken: GetTokenDataSource(),
  ),
);

@CloudFunction()
Future<Response> function(Request request) async {
  var result = await usecase(await request.readAsString());
  return result.fold((l) => Response.forbidden(l.message), (r) => Response.ok(r));
}
