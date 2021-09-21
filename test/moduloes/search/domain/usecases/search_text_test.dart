import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';

class TesteRepositoryImp implements TesteRepository {
  @override
  Future<Either<ErrorSearch, List<TesteSearch>>> search(String listsearch) {
    throw UnimplementedError();
  }
}

main() {
  final repository = TesteRepositoryImp();
  final usecase = SearchByTextImpl(repository);

  test('teste de retorno', () async {
    final result = await usecase("teste");

    expect(result | null, isA<List<TesteSearch>>());
  });
}
