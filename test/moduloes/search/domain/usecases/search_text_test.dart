import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';
import 'package:mockito/mockito.dart';

class TesteRepositoryImp extends Mock implements TesteRepository {}

main() {
  final repository = TesteRepositoryImp();
  final usecase = SearchByTextImpl(repository);

  test('teste de retorno', () async {
    when(repository.search('any'))
        .thenAnswer((_) async => Right(<TesteSearch>[]));

    final result = await usecase("teste");

    expect(result, isA<List<TesteSearch>>());
  });

  test('deve retornar uma exception', () async {
    when(repository.search('any'))
        .thenAnswer((_) async => Right(<TesteSearch>[]));

    var result = await usecase(null);

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());

    result = await usecase("");

    expect(result.isLeft(), true);
    expect(result.fold(id, id), isA<InvalidTextError>());
  });
}
