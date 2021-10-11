import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inspec_solar/modules/app_widget.dart';
import 'package:inspec_solar/modules/search/presenter/search/search_page.dart';

import 'search/domain/usecases/search_text.dart';
import 'search/external/datasource/github_datasource.dart';
import 'search/data/repositories/teste_repository_imp.dart';
import 'search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $SearchByTextImpl,
        $SearchRepositoryImpl,
        $GithubSearchDatasource,
        Bind((i) => Dio()),
        $SearchStore,

        //Bind((i) => Dio()),
        //Bind((i) => SearchByTextImpl(i())),
        //Bind((i) => TesteRepositoryImp(i())),
        //Bind((i) => GitHubDataSource(i())),
      ];

  @override
  List<ModularRoute> get routers => [
        ChildRoute('/', child: (context, args) => SearchPage()),
      ];
  @override
  Widget get bootstrap => AppWidget();
}
