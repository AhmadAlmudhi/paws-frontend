import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/posts_builder.dart';

class MyRequest extends StatelessWidget {
  const MyRequest(
      {super.key, required this.userId, required this.userFavorites});

  final int userId;
  final List userFavorites;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostsBuilder(
          type: 'request',
          id: userId,
          userFavorites: userFavorites,
        ),
      ],
    );
  }
}
