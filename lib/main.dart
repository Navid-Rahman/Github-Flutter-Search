import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'config/app_config.dart';
import 'config/app_theme.dart';
import 'features/repositories/presentation/bloc/repository_bloc.dart';
import 'features/theme/presentation/bloc/theme_bloc.dart';
import 'features/repositories/presentation/pages/repositories_page.dart';
import 'injection_container.dart' as di;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => di.sl<RepositoryBloc>()),
        BlocProvider(create: (_) => di.sl<ThemeBloc>()),
      ],
      child: BlocBuilder<ThemeBloc, ThemeState>(
        builder: (context, themeState) {
          return MaterialApp(
            title: AppConfig.appTitle,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeState.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            home: RepositoriesPage(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
