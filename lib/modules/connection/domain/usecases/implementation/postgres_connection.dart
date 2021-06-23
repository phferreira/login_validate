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
    final _port = int.parse(Platform.environment['DB_PORT'].toString());
    final _host = Platform.environment['DB_HOST'].toString();
    final _user = Platform.environment['DB_USER'].toString();
    final _pass = Platform.environment['DB_PASS'].toString();
    final _name = Platform.environment['DB_NAME'].toString();

    _connection = PostgreSQLConnection(_host, _port, _name, username: _user, password: _pass);
  }

  factory PostgresConnection() {
    return _instance;
  }

  void open() async {
    await _connection.open();
  }

  @override
  Future<Either<Failure, QueryType>> query(String sql) async {
    try {
      var result = await _connection.mappedResultsQuery(sql, substitutionValues: <String, dynamic>{});
      return result.isNotEmpty ? Right(result) : Left(PostgresNotFoundError('Could not find record.'));
    } on PostgreSQLSeverity {
      return Left(PostgresQueryError('Error on execute query.'));
    } on PostgreSQLException catch (e) {
      return Left(PostgresError(e.message.toString()));
    }
  }

  void close() async {
    await _connection.close();
  }
}
