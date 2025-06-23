import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class RepositoryShimmerWidget extends StatelessWidget {
  const RepositoryShimmerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Card(
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: Shimmer.fromColors(
            baseColor: Colors.grey[300]!,
            highlightColor: Colors.grey[100]!,
            child: ListTile(
              leading: CircleAvatar(radius: 25, backgroundColor: Colors.white),
              title: Container(
                height: 16,
                width: double.infinity,
                color: Colors.white,
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 8),
                  Container(
                    height: 12,
                    width: double.infinity,
                    color: Colors.white,
                  ),
                  SizedBox(height: 4),
                  Container(height: 12, width: 150, color: Colors.white),
                  SizedBox(height: 8),
                  Row(
                    children: [
                      Container(height: 12, width: 50, color: Colors.white),
                      SizedBox(width: 16),
                      Container(height: 12, width: 80, color: Colors.white),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
