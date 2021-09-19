import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';

abstract class search_by_text {
  Either<Exception, Future<List<search_by_text>>> call(String listsearch);
}
