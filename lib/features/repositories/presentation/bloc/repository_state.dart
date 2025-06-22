import 'package:equatable/equatable.dart';
import '../../domain/entities/repository.dart';

abstract class RepositoryState extends Equatable {
  const RepositoryState();

  @override
  List<Object> get props => [];
}

class RepositoryInitial extends RepositoryState {}

class RepositoryLoading extends RepositoryState {}

class RepositoryLoaded extends RepositoryState {
  final List<Repository> repositories;
  final String currentSort;

  const RepositoryLoaded({
    required this.repositories,
    required this.currentSort,
  });

  @override
  List<Object> get props => [repositories, currentSort];
}

class RepositoryError extends RepositoryState {
  final String message;

  const RepositoryError({required this.message});

  @override
  List<Object> get props => [message];
}
