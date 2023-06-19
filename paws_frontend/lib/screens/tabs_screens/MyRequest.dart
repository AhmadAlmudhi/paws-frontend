import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/posts_builder.dart';

class MyRequest extends StatelessWidget {
  const MyRequest({super.key, required this.userId});

  final int userId;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        PostsBuilder(
          type: 'request',
          id: userId,
        ),
      ],
    );
  }
}
