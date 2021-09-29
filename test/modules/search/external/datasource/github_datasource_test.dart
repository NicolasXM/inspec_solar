import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:inspec_solar/modules/search/external/datasource/github_datasource.dart';
import 'package:mockito/mockito.dart';

class DioMock extends Mock implements Dio {}

main() {
  final dio = DioMock();

  final datasource = GitHubDataSource(dio);

  test('', () {
    when(dio.get('any'))
        .thenAnswer((_) async => Response(data: {}, statusCode: 200));
  });
}
