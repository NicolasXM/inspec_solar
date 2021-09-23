import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';

abstract class SearchByText {
  Future<Either<ErrorSearch, List<TesteSearch?>>> call(String? listsearch);
}

class SearchByTextImpl implements SearchByText {
  late final TesteRepository? repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<ErrorSearch, List<TesteSearch?>>> call(String? listsearch) async {
    if (listsearch == null && listsearch!.isEmpty) {
      return (Left(InvalidTextError()));
    }

    return repository!.search(listsearch);
  }
}
