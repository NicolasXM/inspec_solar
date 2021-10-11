import 'package:flutter_modular/flutter_modular.dart';
import 'package:inspec_solar/modules/search/data/datasource/teste_datasource.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:dartz/dartz.dart';
import 'package:inspec_solar/modules/search/domain/repositories/teste_repository.dart';

@Injectable(singleton: false)
class TesteRepositoryImp implements TesteRepository {
  final TesteDataSource datasource;
  TesteRepositoryImp(this.datasource);

  @override
  Future<Either<ErrorSearch, List<TesteSearch?>>> search(
      String listsearch) async {
    try {
      final result = await datasource.getSearch(listsearch);
      return Right(result);
    } on DataSourceError catch (e) {
      return Left(e);
    }
  }
}
