import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';

class TesteRepositoryImp implements TesteRepository {
  @override
  Future<Either<ErrorSearch, List<TesteSearch?>>> search(String listsearch) {
    
    throw UnimplementedError();
  }
}
