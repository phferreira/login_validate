import 'package:dart_login/core/error/failure.dart';
import 'package:dart_login/modules/query/domain/errors/failure.dart';
import 'package:dart_login/modules/query/domain/repositories/i_query_repository.dart';
import 'package:dart_login/modules/query/domain/usecases/implementation/query_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';
import '../../../../utils/query_result.dart';
import 'package:dart_login/core/utils/types/query_type.dart';

class QueryRepositoryMock extends Mock implements IQueryRepository {}

void main() {
  final repository = QueryRepositoryMock();
  final usecase = QueryUsecase(repository: repository);

  test('Must be return a query type List<dynamic>', () async {
    when(() => usecase(any())).thenAnswer((_) async => Right(queryResult));

    final result = await usecase(queryConsult);

    expect(result.isRight(), true);
    expect(result, isA<Right<Failure, QueryType>>());
    verify(() => usecase(queryConsult));
  });

  test('Must be return a failure QueryError', () async {
    when(() => usecase(any())).thenAnswer((_) async => Left(QueryError()));

    final result = await usecase(queryConsult);

    expect(result.isLeft(), true);
    expect(result, isA<Left<Failure, QueryType>>());
    verify(() => usecase(queryConsult));
  });
}
