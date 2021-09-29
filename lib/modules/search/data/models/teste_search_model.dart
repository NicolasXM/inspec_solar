import 'dart:convert';

import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';

class TesteSearchModel implements TesteSearch {
  final String? title;
  final String? subtitle;

  TesteSearchModel({required this.title, required this.subtitle});

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'subtitle': subtitle,
    };
  }

  factory TesteSearchModel.fromMap(Map<String, dynamic> map) {
    return TesteSearchModel(
      title: map['title'],
      subtitle: map['subtitle'],
    );
  }

  String toJson() => json.encode(toMap());

  factory TesteSearchModel.fromJson(String source) =>
      TesteSearchModel.fromMap(json.decode(source));
}
