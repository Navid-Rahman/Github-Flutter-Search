import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/repository.dart';

abstract class RepositoryRepository {
  Future<Either<Failure, List<Repository>>> searchRepositories(String query);
  Future<Either<Failure, List<Repository>>> getCachedRepositories();
  Future<Either<Failure, void>> cacheRepositories(
    List<Repository> repositories,
  );
}
