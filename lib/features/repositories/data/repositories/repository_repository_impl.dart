import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/repository.dart';
import '../../domain/repositories/repo_repository.dart';
import '../datasources/repository_remote_data_source.dart';
import '../datasources/respository_local_data_source.dart';
import '../models/repository_model.dart';

class RepositoryRepositoryImpl implements RepositoryRepository {
  final RepositoryRemoteDataSource remoteDataSource;
  final RepositoryLocalDataSource localDataSource;
  final NetworkInfo networkInfo;

  RepositoryRepositoryImpl({
    required this.remoteDataSource,
    required this.localDataSource,
    required this.networkInfo,
  });

  @override
  Future<Either<Failure, List<Repository>>> searchRepositories(
    String query,
  ) async {
    if (await networkInfo.isConnected) {
      try {
        final remoteRepositories = await remoteDataSource.searchRepositories(
          query,
        );
        await localDataSource.cacheRepositories(remoteRepositories);
        return Right(remoteRepositories);
      } on ServerException {
        return Left(ServerFailure());
      }
    } else {
      try {
        final localRepositories = await localDataSource.getCachedRepositories();
        return Right(localRepositories);
      } on CacheException {
        return Left(CacheFailure());
      }
    }
  }

  @override
  Future<Either<Failure, List<Repository>>> getCachedRepositories() async {
    try {
      final localRepositories = await localDataSource.getCachedRepositories();
      return Right(localRepositories);
    } on CacheException {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failure, void>> cacheRepositories(
    List<Repository> repositories,
  ) async {
    try {
      final repositoryModels = repositories
          .map(
            (repo) => RepositoryModel(
              id: repo.id,
              name: repo.name,
              fullName: repo.fullName,
              description: repo.description,
              htmlUrl: repo.htmlUrl,
              stargazersCount: repo.stargazersCount,
              forksCount: repo.forksCount,
              language: repo.language,
              updatedAt: repo.updatedAt,
              createdAt: repo.createdAt,
              owner: OwnerModel(
                id: repo.owner.id,
                login: repo.owner.login,
                avatarUrl: repo.owner.avatarUrl,
                htmlUrl: repo.owner.htmlUrl,
              ),
              topics: repo.topics,
            ),
          )
          .toList();

      await localDataSource.cacheRepositories(repositoryModels);
      return Right(null);
    } on CacheException {
      return Left(CacheFailure());
    }
  }
}
