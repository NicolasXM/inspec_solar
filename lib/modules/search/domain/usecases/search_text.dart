import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';

abstract class SearchByText {
  Future<Either<ErrorSearch, List<SearchByText>>> call(String listsearch);
}

class SearchByTextImpl implements SearchByText {
  
  //Perguntar ao Jheime - eu coloquei final e como sugestão ele pediu para colocar um late antes... não entendi
  late final TesteRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<ErrorSearch, List<SearchByText>>> call(
      String listsearch) async {
    return repository.search(listsearch);
  }
}
