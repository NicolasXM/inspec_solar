import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';

abstract class search_by_text {
  Future<Either<error_search, List<search_by_text>>> call(String listsearch);
}

class search_by_textImpl implements search_by_text {
  @override
  Future<Either<error_search, List<search_by_text>>> call(
      String listsearch) async {}
}
