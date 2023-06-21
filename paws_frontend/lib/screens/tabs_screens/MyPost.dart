import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/posts_builder.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key, required this.userId, required this.userFavorites});

  final int userId;
  final List userFavorites;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostsBuilder(
          type: 'offer',
          id: userId,
          userFavorites: userFavorites,
        ),
      ],
    );
  }
}
