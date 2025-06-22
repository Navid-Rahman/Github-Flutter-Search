import 'package:equatable/equatable.dart';

abstract class RepositoryEvent extends Equatable {
  const RepositoryEvent();

  @override
  List<Object> get props => [];
}

class LoadRepositories extends RepositoryEvent {}

class RefreshRepositories extends RepositoryEvent {}

class SortRepositories extends RepositoryEvent {
  final String sortType;

  const SortRepositories(this.sortType);

  @override
  List<Object> get props => [sortType];
}
