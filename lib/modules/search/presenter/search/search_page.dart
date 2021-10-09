import 'package:flutter/material.dart';

import 'package:flutter_modular/flutter_modular.dart';

class SearchPage extends StatefulWidget {
  @override
  _SearchPageState createState() => _SearchPageState();
}

class _SearchPageState extends ModularState<SearchPage, SearchStore> {
  @override
  Widget _buildList(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHubSearch'),
      ),
      body: Column(
        children: <Widget>[
          TextField(),
          Expanded(child: ListView.builder(itemBuilder: (_, id) {
            return ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(item.image),
              ),
            );
          }))
        ],
      ),
    );
  }
}
