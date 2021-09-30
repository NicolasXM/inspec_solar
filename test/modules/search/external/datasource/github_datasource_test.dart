import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/external/datasource/github_datasource.dart';
import 'package:inspec_solar/modules/search/utils/github_response.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final datasource = GitHubDataSource(dio);

  test('', () async {
    var options;
    when(dio.get('any')).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult),
        statusCode: 200,
        requestOptions: options));

    final result = datasource.getSearch("TesteResult");

    expect(result, completes);
  });

  test('deve retornar um erro ', () async {
    var options;
    when(dio.get('any')).thenAnswer((_) async =>
        Response(data: null, statusCode: 411, requestOptions: options));

    final result = datasource.getSearch("TesteResult");

    expect(result, throwsA(isA<DataSourceError>()));
  });

  test('deve retornar um erro se estiver com erro no package Dio', () async {
    var options;
    when(dio.get('any')).thenThrow(Exception());

    final result = datasource.getSearch("TesteResult");

    expect(result, throwsA(isA<Exception>()));
  });
}
