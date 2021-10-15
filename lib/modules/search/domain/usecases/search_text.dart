import 'package:flutter_modular/flutter_modular.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';

part 'search_text.g.dart';

mixin SearchByText {
  Future<Either<ErrorSearch, List<TesteSearch?>>> call(String listsearch);
}

@Injectable(singleton: false)
class SearchByTextImpl implements SearchByText {
  final TesteRepository repository;

  SearchByTextImpl(this.repository);

  @override
  Future<Either<ErrorSearch, List<TesteSearch?>>> call(
      String listsearch) async {
    var option = optionOf(listsearch);

    return option.fold(() => Left(InvalidTextError()), (text) async {
      var result = await repository.search(text);
      return result.fold(
          (l) => left(l), (r) => r.isEmpty ? left(EmptyList()) : right(r));
    });

    //if (listsearch == null && listsearch!.isEmpty) {
    // return (Left(InvalidTextError()));
    // }

    //return repository!.search(listsearch);
  }
}
