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
    return PopupMenuButton<String>(
      icon: Icon(Icons.sort),
      onSelected: onSortChanged,
      itemBuilder: (BuildContext context) => [
        PopupMenuItem<String>(
          value: 'stars',
          child: Row(
            children: [
              Icon(
                Icons.star,
                color: currentSort == 'stars' ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 8),
              Text('Sort by Stars'),
              if (currentSort == 'stars') ...[
                Spacer(),
                Icon(Icons.check, color: Colors.blue),
              ],
            ],
          ),
        ),
        PopupMenuItem<String>(
          value: 'updated',
          child: Row(
            children: [
              Icon(
                Icons.access_time,
                color: currentSort == 'updated' ? Colors.blue : Colors.grey,
              ),
              SizedBox(width: 8),
              Text('Sort by Updated'),
              if (currentSort == 'updated') ...[
                Spacer(),
                Icon(Icons.check, color: Colors.blue),
              ],
            ],
          ),
        ),
      ],
    );
  }
}
