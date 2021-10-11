import 'package:dio/dio.dart';
import 'package:inspec_solar/modules/search/data/datasource/teste_datasource.dart';
import 'package:inspec_solar/modules/search/data/models/teste_search_model.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';

class GitHubDataSource implements TesteDataSource {
  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<TesteSearchModel?>> getSearch(String? listsearch) async {
    final response =
        await dio.get("https://api.github.com/search/users?q=nicolasxm");

    // ignore: unrelated_type_equality_checks
    if (response.statusCode == "200") {
      var jsonList = response.data['items'] as List;
      final list =
          (jsonList).map((item) => TesteSearchModel.fromMap(item)).toList();

      return list;
    } else {
      throw DataSourceError("Erro");
    }
  }
}
