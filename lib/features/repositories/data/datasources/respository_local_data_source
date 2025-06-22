import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../core/error/exceptions.dart';
import '../models/repository_model.dart';

abstract class RepositoryLocalDataSource {
  Future<List<RepositoryModel>> getCachedRepositories();
  Future<void> cacheRepositories(List<RepositoryModel> repositories);
  Future<String?> getCachedSortPreference();
  Future<void> cacheSortPreference(String sortType);
}

class RepositoryLocalDataSourceImpl implements RepositoryLocalDataSource {
  final SharedPreferences sharedPreferences;
  static const String cachedRepositoriesKey = 'CACHED_REPOSITORIES';
  static const String sortPreferenceKey = 'SORT_PREFERENCE';

  RepositoryLocalDataSourceImpl({required this.sharedPreferences});

  @override
  Future<List<RepositoryModel>> getCachedRepositories() {
    final jsonString = sharedPreferences.getString(cachedRepositoriesKey);
    if (jsonString != null) {
      final List<dynamic> jsonList = json.decode(jsonString);
      return Future.value(
        jsonList.map((json) => RepositoryModel.fromJson(json)).toList(),
      );
    } else {
      throw CacheException();
    }
  }

  @override
  Future<void> cacheRepositories(List<RepositoryModel> repositories) {
    final jsonString = json.encode(
      repositories.map((repo) => repo.toJson()).toList(),
    );
    return sharedPreferences.setString(cachedRepositoriesKey, jsonString);
  }

  @override
  Future<String?> getCachedSortPreference() async {
    return sharedPreferences.getString(sortPreferenceKey);
  }

  @override
  Future<void> cacheSortPreference(String sortType) async {
    await sharedPreferences.setString(sortPreferenceKey, sortType);
  }
}