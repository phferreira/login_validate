import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/connection/domain/errors/failure.dart';
import 'package:dart_login/modules/connection/domain/usecases/implementation/postgres_connection.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

void main() {
  PostgresConnection().open();
  test('Must be connect to postgres database and result a query', () async {
    final sql = '''
      select teste.result
        from (select 1 as result) as "teste"
      limit 1
    ''';
    var result = await PostgresConnection().query(sql);
    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, QueryType>>());
    expect(result.foldLeft(PostgresError(), (previous, r) => r[0]['']['result']), 1);
  });
}
