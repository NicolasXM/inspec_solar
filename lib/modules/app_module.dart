import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:inspec_solar/modules/app_widget.dart';
import 'package:inspec_solar/modules/search/presenter/search/search_store_page.dart';

import 'search/domain/usecases/search_text.dart';
import 'search/external/datasource/github_datasource.dart';
import 'search/data/repositories/teste_repository_imp.dart';
import 'search/presenter/search/search_page.dart';

class AppModule extends Module {
  @override
  List<Bind> get binds => [
        $TesteRepositoryImp,
        $SearchByTextImpl,
        $GithubDatasource,
        Bind((i) => Dio()),
        $SearchStore,
      ];

  @override
  // ignore: override_on_non_overriding_member
  List<ModularRoute> get routers => [
        ChildRoute('/', child: (context, args) => SearchPage()),
      ];
  @override
  // ignore: override_on_non_overriding_member
  Widget get bootstrap => AppWidget();
}
