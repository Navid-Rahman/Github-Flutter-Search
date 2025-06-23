import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum ThemeEvent { toggleTheme }

class ThemeState {
  final bool isDarkMode;

  ThemeState({required this.isDarkMode});
}

class ThemeBloc extends Bloc<ThemeEvent, ThemeState> {
  final SharedPreferences sharedPreferences;
  static const String themeKey = 'THEME_KEY';

  ThemeBloc({required this.sharedPreferences})
    : super(
        ThemeState(isDarkMode: sharedPreferences.getBool(themeKey) ?? false),
      ) {
    on<ThemeEvent>((event, emit) async {
      final newTheme = !state.isDarkMode;
      await sharedPreferences.setBool(themeKey, newTheme);
      emit(ThemeState(isDarkMode: newTheme));
    });
  }
}
