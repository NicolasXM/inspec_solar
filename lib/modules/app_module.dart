import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inspec_solar/modules/app_widget.dart';
import 'package:inspec_solar/modules/search/data/repositories/teste_repository_imp.dart';
import 'package:inspec_solar/modules/search/domain/usecases/search_text.dart';
import 'package:inspec_solar/modules/search/external/datasource/github_datasource.dart';
import 'package:inspec_solar/modules/search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((i) => Dio()),
        Bind((i) => SearchByTextImpl(i())),
        Bind((i) => TesteRepositoryImp(i())),
        Bind((i) => GitHubDataSource(i())),
      ];

  @override
  List<ModularRoute> get routers => [
        ChildRoute('/', child: (context, args) => SearchPageState()),
      ];
  @override
  Widget get bootstrap => AppWidget();
}
