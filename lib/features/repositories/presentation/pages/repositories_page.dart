import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/repository_bloc.dart';
import '../bloc/repository_event.dart';
import '../bloc/repository_state.dart';
import '../widgets/error_widget.dart';
import '../widgets/repository_shimmer_widget.dart';
import '../widgets/sort_button_widgets.dart';
import '../widgets/repository_list_widget.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({super.key});

  @override
  RepositoriesPageState createState() => RepositoriesPageState();
}

class RepositoriesPageState extends State<RepositoriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RepositoryBloc>(context).add(LoadRepositories());
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      backgroundColor: theme.colorScheme.surface,
      appBar: AppBar(
        title: const Text('Flutter Repositories'),
        actions: [
          // Theme toggle button (assuming you have ThemeBloc)
          IconButton(
            icon: Icon(
              theme.brightness == Brightness.dark
                  ? Icons.light_mode
                  : Icons.dark_mode,
              color: theme.iconTheme.color,
            ),
            onPressed: () {
              // Toggle theme - you'll need to implement this with your ThemeBloc
              // context.read<ThemeBloc>().add(ToggleTheme());
            },
            tooltip: 'Toggle theme',
          ),

          // Sort button
          BlocBuilder<RepositoryBloc, RepositoryState>(
            builder: (context, state) {
              if (state is RepositoryLoaded) {
                return SortButtonWidget(
                  currentSort: state.currentSort,
                  onSortChanged: (sortType) {
                    BlocProvider.of<RepositoryBloc>(
                      context,
                    ).add(SortRepositories(sortType));
                  },
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
      body: BlocBuilder<RepositoryBloc, RepositoryState>(
        builder: (context, state) {
          if (state is RepositoryInitial) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.code,
                    size: 64,
                    color: theme.iconTheme.color?.withOpacity(0.5),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    'Welcome to Flutter GitHub Search',
                    style: TextStyle(
                      fontSize: 18,
                      color: theme.textTheme.bodyLarge?.color,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Discover amazing Flutter repositories',
                    style: theme.textTheme.bodyMedium,
                  ),
                ],
              ),
            );
          } else if (state is RepositoryLoading) {
            return const RepositoryShimmerWidget();
          } else if (state is RepositoryLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<RepositoryBloc>(
                  context,
                ).add(RefreshRepositories());
              },
              color: theme.colorScheme.primary,
              backgroundColor: theme.colorScheme.surface,
              child: state.repositories.isEmpty
                  ? _buildEmptyState(context)
                  : RepositoryListWidget(repositories: state.repositories),
            );
          } else if (state is RepositoryError) {
            return ErrorDisplayWidget(
              message: state.message,
              onRetry: () {
                BlocProvider.of<RepositoryBloc>(
                  context,
                ).add(LoadRepositories());
              },
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final theme = Theme.of(context);

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.search_off,
              size: 64,
              color: theme.iconTheme.color?.withOpacity(0.5),
            ),
            const SizedBox(height: 16),
            Text(
              'No repositories found',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: theme.textTheme.bodyLarge?.color,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Try refreshing or check your connection',
              style: theme.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 24),
            ElevatedButton.icon(
              onPressed: () {
                BlocProvider.of<RepositoryBloc>(
                  context,
                ).add(RefreshRepositories());
              },
              icon: const Icon(Icons.refresh),
              label: const Text('Refresh'),
            ),
          ],
        ),
      ),
    );
  }
}
