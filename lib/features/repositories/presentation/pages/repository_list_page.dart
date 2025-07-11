import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/repository_bloc.dart';
import '../bloc/repository_event.dart';
import '../bloc/repository_state.dart';
import '../widgets/repository_list_widget.dart';
import '../widgets/sort_button_widgets.dart';

class RepositoriesPage extends StatefulWidget {
  const RepositoriesPage({super.key});

  @override
  _RepositoriesPageState createState() => _RepositoriesPageState();
}

class _RepositoriesPageState extends State<RepositoriesPage> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<RepositoryBloc>(context).add(LoadRepositories());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Repositories'),
        actions: [
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
              return Container();
            },
          ),
        ],
      ),
      body: BlocBuilder<RepositoryBloc, RepositoryState>(
        builder: (context, state) {
          if (state is RepositoryInitial) {
            return Center(child: Text('Welcome to Flutter GitHub Search'));
          } else if (state is RepositoryLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is RepositoryLoaded) {
            return RefreshIndicator(
              onRefresh: () async {
                BlocProvider.of<RepositoryBloc>(
                  context,
                ).add(RefreshRepositories());
              },
              child: RepositoryListWidget(repositories: state.repositories),
            );
          } else if (state is RepositoryError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Error: ${state.message}',
                    style: TextStyle(color: Colors.red),
                  ),
                  SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<RepositoryBloc>(
                        context,
                      ).add(LoadRepositories());
                    },
                    child: Text('Retry'),
                  ),
                ],
              ),
            );
          }
          return Container();
        },
      ),
    );
  }
}
