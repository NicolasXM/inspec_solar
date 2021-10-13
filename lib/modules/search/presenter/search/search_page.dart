import 'dart:core';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';
import 'package:inspec_solar/modules/search/domain/errors/error_search.dart';
import 'package:inspec_solar/modules/search/presenter/search/state/search_state.dart';

import 'search_store_page.dart';
import 'state/search_state.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  @override
  Widget _buildList(List<TesteSearch> list) {
    return ListView.builder(
        itemCount: list.length,
        itemBuilder: (_, index) {
          var item = list[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(item.image),
            ),
            title: Text(item.nickname),
          );
        });
  }

  Widget _buildError(ErrorSearch error) {
    if (error is EmptyList) {
      return Center(child: Text("Nenhum valor encontrado"));
    } else if (error is ErrorSearch) {
      return Center(child: Text("Erro no GitHub"));
    } else {
      return Center(child: Text("Erro interno"));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("GitHub Search"),
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 8, right: 8, left: 8),
            child: TextField(
              onChanged: controller.setSearchText,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Pesquise...",
              ),
            ),
          ),
          Expanded(
            child: Observer(builder: (_) {
              var state = controller.state;

              if (state is ErrorState) {
                return _buildError(state.error);
              }

              if (state is StartState) {
                return Center(
                  child: Text("Digite algum nome:"),
                );
              } else if (state is LoagindState) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else if (state is SuccessState) {
                return _buildList(state.list);
              } else {
                return Container();
              }
            }),
          )
        ],
      ),
    );
  }
}
