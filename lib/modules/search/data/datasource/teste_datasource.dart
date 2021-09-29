import 'package:inspec_solar/modules/search/data/models/teste_search_model.dart';

abstract class TesteDataSource {
  Future<List<TesteSearchModel>> getSearch(String listsearch);
}
