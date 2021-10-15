import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';
import 'package:inspec_solar/modules/search/presenter/search/state/search_state.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:async/async.dart';
import 'package:mobx/mobx.dart';

import 'state/search_state.dart';

part 'search_store.g.dart';

@Injectable()
class SearchStore = _SearchStoreBase with _$SearchStore;

abstract class _SearchStoreBase with Store {
  final SearchByText searchByText;

  final CancelableOperation cancelableOperation;

  _SearchStoreBase(this.searchByText, this.cancelableOperation) {
    reaction((_) => searchByText, (text) async {
      stateReaction(text, cancelableOperation);
    }, delay: 500);
  }

  Future stateReaction(
      String text, CancelableOperation cancelableOperation) async {
    await cancelableOperation.cancel();
    cancelableOperation =
        CancelableOperation<SearchState>.fromFuture(makeSearch(text));

    if (text.isEmpty) {
      setState(StartState());
      return;
    }

    setState(LoagindState());

    setState(await cancelableOperation.valueOrCancellation(LoagindState()));
  }

  Future<SearchState> makeSearch(String text) async {
    var result = await searchByText(text);
    return result.fold((l) => ErrorState(l), (r) => SuccessState(r));
  }

  @observable
  String searchText = "";

  @observable
  SearchState state = StartState();

  @action
  setSearchText(String value) => searchText = value;

  @action
  setState(SearchState value) => state = value;
}
