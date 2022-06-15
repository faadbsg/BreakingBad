import 'dart:convert';

import 'package:app_breaking_bad/common/error/exception.dart';
import 'package:app_breaking_bad/data/models/characters_models.dart';
import 'package:http/http.dart' as http;

abstract class CharactersRemoteDataSources {
  Future<List<CharactersModels>> getCharacters();
}

class CharactersRemoteDataSourcesImpl implements CharactersRemoteDataSources {
  final http.Client client;

  CharactersRemoteDataSourcesImpl({required this.client});
  @override
  Future<List<CharactersModels>> getCharacters() async {
    final response = await client.get(
      Uri.parse('https://www.breakingbadapi.com/api/characters'),
      headers: {
        'Content-Type': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      final jsonMap = json.decode(response.body);
      final result = jsonMap as List<dynamic>;
      final resultModel = result
          .map((e) => CharactersModels.fromJson(Map<String, dynamic>.from(e)))
          .toList();
      return resultModel;
    } else {
      throw ServerException();
    }
  }
}
