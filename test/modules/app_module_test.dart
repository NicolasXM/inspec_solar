import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/app_module.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';

main() {
  init();

  test('Deve recuperar o usecase sem erro', () {
    final usecase = Modular.get<SearchByText>();

    expect(usecase, isA<SearchByText>());
  });
}
