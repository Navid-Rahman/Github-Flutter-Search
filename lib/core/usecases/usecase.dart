import 'package:dartz/dartz.dart';
import 'package:github_flutter_search/core/error/failures.dart';

abstract class Usecase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}

class NoParams {}
