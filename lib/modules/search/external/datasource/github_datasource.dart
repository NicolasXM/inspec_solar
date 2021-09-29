import 'package:dio/dio.dart';
import 'package:inspec_solar/modules/search/data/datasource/teste_datasource.dart';
import 'package:inspec_solar/modules/search/data/models/teste_search_model.dart';

class GitHubDataSource implements TesteDataSource {
  final Dio dio;

  GitHubDataSource(this.dio);

  @override
  Future<List<TesteSearchModel>> getSearch(String listsearch) {}
}
