import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';

abstract class search_by_text {
  Future<List<search_by_text>> call(String listsearch);
}
