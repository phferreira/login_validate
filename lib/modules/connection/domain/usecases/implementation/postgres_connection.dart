import 'dart:async';
import 'dart:io';
import 'package:dart_login/core/utils/types/query_type.dart';
import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/connection/domain/errors/failure.dart';
import 'package:dart_login/modules/connection/domain/usecases/i_connection_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:postgres/postgres.dart';

class PostgresConnection extends IConnection {
  static final PostgresConnection _instance = PostgresConnection._internal();
  late final PostgreSQLConnection _connection;

  PostgresConnection._internal() {
    print('internal');
    final _port = int.parse(Platform.environment['DB_PORT'].toString());
    final _host = Platform.environment['DB_HOST'].toString();
    final _user = Platform.environment['DB_USER'].toString();
    final _pass = Platform.environment['DB_PASS'].toString();
    final _name = Platform.environment['DB_NAME'].toString();
    try {
      _connection = PostgreSQLConnection(_host, _port, _name, username: _user, password: _pass);
    } catch (e) {
      throw PostgresConnectionError('Error on internal set params.');
    }
  }

  factory PostgresConnection() {
    print('factory');
    return _instance;
  }

  void open() async {
    await _connection.open().whenComplete(() => print('connect'));
  }

  @override
  Future<Either<Failure, QueryType>> query(String sql) async {
    print('query');
    try {
      return Right(await _connection.mappedResultsQuery(sql));
    } on PostgresConnectionError catch (e) {
      return Left(PostgresConnectionError(e.message));
    } catch (e) {
      return Left(PostgresQueryError('Error on execute query.'));
    }
  }

  void close() async {
    await _connection.close();
  }
}
