import 'package:dart_login/core/utils/types/query_type.dart';

final String queryConsult = 'select 1 as result from pg_catalog.pg_stat_activity limit 1;';

final QueryType queryResult = [
  {
    'tableName': {'columnName': '1'}
  }
];
