import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/app_module.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';
import 'package:inspec_solar/modules/utils/github_response.dart';
import 'package:mockito/mockito.dart';
import 'package:modular_test/modular_test.dart';

class DioMock extends Mock implements Dio {}

main() {
  final diomock = DioMock();

  initModule(AppModule(), replaceBinds: [
    Bind<Dio>((i) => diomock),
  ]);

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByText>());
  });

  test('Deve trazer uma lista de SearchbyText', () async {
    var options;
    when(diomock.get('any')).thenAnswer((_) async => Response(
        data: jsonDecode(githubResult),
        statusCode: 200,
        requestOptions: options));

    final usecase = Modular.get<SearchByText>();

    final result = await usecase("Teste");

    expect(result, isA<List<SearchByText>>());
  });
}
