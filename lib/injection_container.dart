import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import 'core/network/network_info.dart';
import 'features/repositories/data/datasources/repository_remote_data_source.dart';
import 'features/repositories/data/datasources/respository_local_data_source.dart';
import 'features/repositories/data/repositories/repository_repository_impl.dart';
import 'features/repositories/domain/repositories/repo_repository.dart';
import 'features/repositories/domain/usecases/get_repositories.dart';
import 'features/repositories/presentation/bloc/repository_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //! Features - Repositories
  // Bloc
  sl.registerFactory(
    () => RepositoryBloc(getRepositories: sl(), networkInfo: sl()),
  );

  // Use cases
  sl.registerLazySingleton(() => GetRepositories(sl()));

  // Repository
  sl.registerLazySingleton<RepositoryRepository>(
    () => RepositoryRepositoryImpl(
      remoteDataSource: sl(),
      localDataSource: sl(),
      networkInfo: sl(),
    ),
  );

  // Data sources
  sl.registerLazySingleton<RepositoryRemoteDataSource>(
    () => RepositoryRemoteDataSourceImpl(client: sl()),
  );

  sl.registerLazySingleton<RepositoryLocalDataSource>(
    () => RepositoryLocalDataSourceImpl(sharedPreferences: sl()),
  );

  //! Core
  sl.registerLazySingleton<NetworkInfo>(() => NetworkInfoImpl(sl()));

  //! External
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);
  sl.registerLazySingleton(() => http.Client());
  sl.registerLazySingleton(() => Connectivity());
}
