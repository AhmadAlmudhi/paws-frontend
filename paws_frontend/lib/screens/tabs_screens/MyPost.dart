import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/posts_builder.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostsBuilder(
          type: 'offer',
          id: userId,
        ),
      ],
    );
  }
}
