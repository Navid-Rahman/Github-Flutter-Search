class AppConfig {
  static const String appName = 'Flutter GitHub Search';
  static const String packageName = 'com.example.github_flutter_search';

  // Environment-specific configurations
  static bool get isProduction => const bool.fromEnvironment('PRODUCTION');
  static bool get isDevelopment => !isProduction;

  static String get apiBaseUrl => isProduction
      ? 'https://api.github.com'
      : 'https://api.github.com'; //Different for dev

  static String get appTitle => isDevelopment ? '$appName (Dev)' : appName;
}
