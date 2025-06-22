import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/network/network_info.dart';
import '../../domain/entities/repository.dart';
import '../../domain/usecases/get_repositories.dart';
import 'repository_event.dart';
import 'repository_state.dart';

class RepositoryBloc extends Bloc<RepositoryEvent, RepositoryState> {
  final GetRepositories getRepositories;
  final NetworkInfo networkInfo;

  RepositoryBloc({required this.getRepositories, required this.networkInfo})
    : super(RepositoryInitial()) {
    on<LoadRepositories>(_onLoadRepositories);
    on<RefreshRepositories>(_onRefreshRepositories);
    on<SortRepositories>(_onSortRepositories);
  }

  Future<void> _onLoadRepositories(
    LoadRepositories event,
    Emitter<RepositoryState> emit,
  ) async {
    emit(RepositoryLoading());

    final result = await getRepositories(ApiConstants.searchQuery);

    result.fold(
      (failure) =>
          emit(RepositoryError(message: _mapFailureToMessage(failure))),
      (repositories) => emit(
        RepositoryLoaded(repositories: repositories, currentSort: 'stars'),
      ),
    );
  }

  Future<void> _onRefreshRepositories(
    RefreshRepositories event,
    Emitter<RepositoryState> emit,
  ) async {
    if (state is RepositoryLoaded) {
      final currentState = state as RepositoryLoaded;
      emit(RepositoryLoading());

      final result = await getRepositories(ApiConstants.searchQuery);

      result.fold(
        (failure) =>
            emit(RepositoryError(message: _mapFailureToMessage(failure))),
        (repositories) => emit(
          RepositoryLoaded(
            repositories: repositories,
            currentSort: currentState.currentSort,
          ),
        ),
      );
    }
  }

  void _onSortRepositories(
    SortRepositories event,
    Emitter<RepositoryState> emit,
  ) {
    if (state is RepositoryLoaded) {
      final currentState = state as RepositoryLoaded;
      final sortedRepositories = _sortRepositories(
        currentState.repositories,
        event.sortType,
      );

      emit(
        RepositoryLoaded(
          repositories: sortedRepositories,
          currentSort: event.sortType,
        ),
      );
    }
  }

  List<Repository> _sortRepositories(
    List<Repository> repositories,
    String sortType,
  ) {
    final sortedList = List<Repository>.from(repositories);

    switch (sortType) {
      case 'stars':
        sortedList.sort(
          (a, b) => b.stargazersCount.compareTo(a.stargazersCount),
        );
        break;
      case 'updated':
        sortedList.sort((a, b) => b.updatedAt.compareTo(a.updatedAt));
        break;
    }

    return sortedList;
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return 'Server Error';
      case NetworkFailure:
        return 'Network Error';
      case CacheFailure:
        return 'Cache Error';
      default:
        return 'Unexpected Error';
    }
  }
}
