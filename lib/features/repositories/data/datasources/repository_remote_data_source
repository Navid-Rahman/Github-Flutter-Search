import 'dart:convert';
import 'package:http/http.dart' as http;
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/exceptions.dart';
import '../models/repository_model.dart';

abstract class RepositoryRemoteDataSource {
  Future<List<RepositoryModel>> searchRepositories(String query);
}

class RepositoryRemoteDataSourceImpl implements RepositoryRemoteDataSource {
  final http.Client client;

  RepositoryRemoteDataSourceImpl({required this.client});

  @override
  Future<List<RepositoryModel>> searchRepositories(String query) async {
    final response = await client.get(
      Uri.parse(
        '${ApiConstants.baseUrl}${ApiConstants.searchRepositories}?q=$query&sort=stars&order=desc&per_page=${ApiConstants.perPage}',
      ),
      headers: {'Content-Type': 'application/json'},
    );

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      final List<dynamic> repositoriesJson = jsonResponse['items'];
      
      return repositoriesJson
          .map((json) => RepositoryModel.fromJson(json))
          .toList();
    } else {
      throw ServerException();
    }
  }
}