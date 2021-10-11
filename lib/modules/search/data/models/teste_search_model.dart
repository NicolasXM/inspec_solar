import 'dart:convert';
import 'package:inspec_solar/modules/search/domain/entities/teste_search.dart';

class TesteSearchModel implements TesteSearch {
  final String image;
  final String name;
  final String nickname;
  final String url;

  const TesteSearchModel(
      {required this.image,
      required this.name,
      required this.nickname,
      required this.url});

  Map<String, dynamic> toMap() {
    return {
      'image': image,
      'name': name,
      'nickname': nickname,
      'url': url,
    };
  }

  static TesteSearchModel? fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return TesteSearchModel(
      image: map['image'],
      name: map['name'],
      nickname: map['nickname'],
      url: map['url'],
    );
  }

  String toJson() => json.encode(toMap());

  static TesteSearchModel? fromJson(String source) =>
      fromMap(json.decode(source));
}
