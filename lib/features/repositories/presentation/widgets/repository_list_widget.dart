import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:intl/intl.dart';
import '../../../../config/app_theme.dart';
import '../../domain/entities/repository.dart';
import '../pages/repository_details_page.dart';

class RepositoryListWidget extends StatelessWidget {
  final List<Repository> repositories;

  const RepositoryListWidget({super.key, required this.repositories});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: repositories.length,
      itemBuilder: (context, index) {
        final repository = repositories[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 16),
          child: Card(
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        RepositoryDetailPage(repository: repository),
                  ),
                );
              },
              borderRadius: BorderRadius.circular(8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Header with owner and repo name
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 16,
                          backgroundImage: CachedNetworkImageProvider(
                            repository.owner.avatarUrl,
                          ),
                        ),
                        const SizedBox(width: 8),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                repository.owner.login,
                                style: theme.textTheme.bodySmall,
                              ),
                              Text(
                                repository.name,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: theme.colorScheme.primary,
                                ),
                              ),
                            ],
                          ),
                        ),
                        Icon(
                          Icons.arrow_forward_ios,
                          size: 16,
                          color: theme.iconTheme.color,
                        ),
                      ],
                    ),

                    // Description
                    if (repository.description.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Text(
                        repository.description,
                        style: theme.textTheme.bodyMedium,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],

                    const SizedBox(height: 12),

                    // Repository stats
                    Row(
                      children: [
                        // Language
                        if (repository.language.isNotEmpty) ...[
                          Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              color: AppTheme.languageColor,
                              shape: BoxShape.circle,
                            ),
                          ),
                          const SizedBox(width: 4),
                          Text(
                            repository.language,
                            style: theme.textTheme.bodySmall,
                          ),
                          const SizedBox(width: 16),
                        ],

                        // Stars
                        Icon(Icons.star, size: 16, color: AppTheme.starColor),
                        const SizedBox(width: 4),
                        Text(
                          _formatCount(repository.stargazersCount),
                          style: theme.textTheme.bodySmall,
                        ),
                        const SizedBox(width: 16),

                        // Forks
                        Icon(
                          Icons.call_split,
                          size: 16,
                          color: theme.iconTheme.color,
                        ),
                        const SizedBox(width: 4),
                        Text(
                          _formatCount(repository.forksCount),
                          style: theme.textTheme.bodySmall,
                        ),

                        const Spacer(),

                        // Updated date
                        Text(
                          'Updated ${_formatDate(repository.updatedAt)}',
                          style: theme.textTheme.bodySmall,
                        ),
                      ],
                    ),

                    // Topics
                    if (repository.topics.isNotEmpty) ...[
                      const SizedBox(height: 8),
                      Wrap(
                        spacing: 4,
                        runSpacing: 4,
                        children: repository.topics.take(3).map((topic) {
                          return Chip(
                            label: Text(topic),
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          );
                        }).toList(),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  String _formatCount(int count) {
    if (count >= 1000) {
      return '${(count / 1000).toStringAsFixed(1)}k';
    }
    return count.toString();
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final difference = now.difference(date);

    if (difference.inDays > 365) {
      return 'on ${DateFormat('MMM d, yyyy').format(date)}';
    } else if (difference.inDays > 30) {
      return '${(difference.inDays / 30).floor()} months ago';
    } else if (difference.inDays > 0) {
      return '${difference.inDays} days ago';
    } else if (difference.inHours > 0) {
      return '${difference.inHours} hours ago';
    } else {
      return 'now';
    }
  }
}
