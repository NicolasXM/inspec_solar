import 'package:flutter/material.dart';

class SearchPage extends StatefulWidget {
  @override
  SearchPage_State createState() => SearchPage_State();
}

class SearchPage_State extends State<SearchPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GitHubSearch'),
      ),
      body: Column(
        children: <Widget>[
          TextField(),
          Expanded(child: ListView.builder(itemBuilder: (_, id) {
            return ListTile();
          }))
        ],
      ),
    );
  }
}
