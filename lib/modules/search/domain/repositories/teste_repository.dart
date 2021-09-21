import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';

abstract class TesteRepository {
  Future<Either<ErrorSearch, List<TesteSearch>>> search(String listsearch);
}
