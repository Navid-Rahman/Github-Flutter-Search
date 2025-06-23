import '../../config/app_config.dart';

class ApiConstants {
  static final String baseUrl = AppConfig.apiBaseUrl;
  static const String searchRepositories = '/search/repositories';
  static const String searchQuery = 'Flutter';
  static const int perPage = 50;
}
