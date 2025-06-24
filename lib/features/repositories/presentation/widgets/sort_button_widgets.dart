import 'package:flutter/material.dart';

class SortButtonWidget extends StatelessWidget {
  final String currentSort;
  final Function(String) onSortChanged;

  const SortButtonWidget({
    super.key,
    required this.currentSort,
    required this.onSortChanged,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PopupMenuButton<String>(
      icon: Icon(Icons.sort, color: theme.iconTheme.color),
      onSelected: onSortChanged,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide(color: theme.colorScheme.outline.withOpacity(0.3)),
      ),
      color: theme.colorScheme.surface,
      elevation: 8,
      tooltip: 'Sort repositories',
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'stars',
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: currentSort == 'stars'
                    ? theme.colorScheme.primary
                    : theme.iconTheme.color,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Sort by Stars',
                  style: TextStyle(
                    color: currentSort == 'stars'
                        ? theme.colorScheme.primary
                        : theme.textTheme.bodyLarge?.color,
                    fontWeight: currentSort == 'stars'
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (currentSort == 'stars')
                Icon(Icons.check, color: theme.colorScheme.primary, size: 20),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'updated',
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                color: currentSort == 'updated'
                    ? theme.colorScheme.primary
                    : theme.iconTheme.color,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Sort by Last Updated',
                  style: TextStyle(
                    color: currentSort == 'updated'
                        ? theme.colorScheme.primary
                        : theme.textTheme.bodyLarge?.color,
                    fontWeight: currentSort == 'updated'
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (currentSort == 'updated')
                Icon(Icons.check, color: theme.colorScheme.primary, size: 20),
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'best_match',
          child: Row(
            children: [
              Icon(
                Icons.search,
                color: currentSort == 'best_match'
                    ? theme.colorScheme.primary
                    : theme.iconTheme.color,
                size: 20,
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Text(
                  'Best Match',
                  style: TextStyle(
                    color: currentSort == 'best_match'
                        ? theme.colorScheme.primary
                        : theme.textTheme.bodyLarge?.color,
                    fontWeight: currentSort == 'best_match'
                        ? FontWeight.w600
                        : FontWeight.normal,
                  ),
                ),
              ),
              if (currentSort == 'best_match')
                Icon(Icons.check, color: theme.colorScheme.primary, size: 20),
            ],
          ),
        ),
      ],
    );
  }
}
