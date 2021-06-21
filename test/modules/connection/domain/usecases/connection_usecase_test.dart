import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/connection/domain/usecases/implementation/postgres_connection.dart';
import 'package:dartz/dartz.dart';
import 'package:test/test.dart';
import 'package:dart_login/core/utils/types/query_type.dart';
import '../../../../utils/query_result.dart';

void main() {
  test('description', () async {
    var result;
    try {
      PostgresConnection().open();
      result = await PostgresConnection().query(queryConsult);
    } catch (e) {
      print(e);
      print('erro');
    }
    print(result);
    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, QueryType>>());
    // expect(result, [{:{'result': '1'}}]);
  });
}
