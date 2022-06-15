import 'dart:convert';

import 'package:app_breaking_bad/common/error/exception.dart';
import 'package:app_breaking_bad/data/models/episodes_models.dart';
import 'package:http/http.dart' as http;

abstract class EpisodesRemoteDataSources {
  Future<List<EpisodesModels>> getEpisodes();
}

class EpisodesRemoteDataSourcesImpl implements EpisodesRemoteDataSources {
  final http.Client client;

  EpisodesRemoteDataSourcesImpl({required this.client});

  @override
  Future<List<EpisodesModels>> getEpisodes() async {
    final response = await client.get(
      Uri.parse('https://www.breakingbadapi.com/api/episodes'),
      headers: {'Content-Type': 'application/json'},
    );
    if (response.statusCode == 200) {
      final jsonDecode = json.decode(response.body);
      final result = jsonDecode as List<dynamic>;
      final resultModel = result
          .map((e) => EpisodesModels.fromJson(e as Map<String, dynamic>))
          .toList();
      return resultModel;
    } else {
      throw ServerException();
    }
  }
}
