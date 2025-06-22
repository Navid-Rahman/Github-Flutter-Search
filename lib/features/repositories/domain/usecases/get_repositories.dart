import 'package:dartz/dartz.dart';
import 'package:github_flutter_search/core/usecases/usecase.dart';
import 'package:github_flutter_search/features/repositories/domain/repositories/repo_repository.dart';
import '../../../../core/error/failures.dart';
import '../entities/repository.dart';

class GetRepositories implements Usecase<List<Repository>, String> {
  final RepositoryRepository repository;

  GetRepositories(this.repository);

  @override
  Future<Either<Failure, List<Repository>>> call(String query) async {
    return await repository.searchRepositories(query);
  }
}
