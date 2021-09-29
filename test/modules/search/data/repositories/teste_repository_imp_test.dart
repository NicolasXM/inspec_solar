import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/search/data/datasource/teste_datasource.dart';
import 'package:inspec_solar/modules/search/data/models/teste_search_model.dart';
import 'package:inspec_solar/modules/search/data/repositories/teste_repository_imp.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:mockito/mockito.dart';

class TesteDataSourceMock extends Mock implements TesteDataSource {}

main() {
  final datasource = TesteDataSourceMock();
  final repository = TesteRepositoryImp(datasource);

  test('deve retornar uma lista de TesteSearch', () async {
    when(datasource.getSearch('any'))
        .thenAnswer((_) async => <TesteSearchModel>[]);

    final result = await repository.search("Teste");
    expect(result, isA<List<TesteSearch>>());
  });

  test('deve retornar erro no Datasource', () async {
    when(datasource.getSearch('any')).thenThrow(Exception());

    final result = await repository.search("Teste");
    expect(result.fold(id, id), isA<DataSourceError>());
  });
}
