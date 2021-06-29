import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/core/utils/types/json_types.dart';
import 'package:dart_login/modules/login_validate/infrastructures/datasources/i_get_token_datasource.dart';

class GetTokenDataSource extends IGetTokenDatasource {
  final dio = Dio();

  @override
  Future<Either<Failure, ResultType>> getToken(JsonResultType param) async {
    var response = (await dio.post(
      'http://' + Platform.environment['GET_TOKEN_API'].toString(),
      data: base64Encode(utf8.encode(jsonEncode(param))),
    ));
    return Right(response.data);
  }
}
