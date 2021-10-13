import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';

abstract class SearchState {}

class StartState implements SearchState {
  const StartState();
}

class LoagindState implements SearchState {
  const LoagindState();
}

class ErrorState implements SearchState {
  final ErrorSearch error;
  const ErrorState(this.error);
}

class SuccessState implements SearchState {
  final List<TesteSearch> list;

  const SuccessState(this.list);
}
