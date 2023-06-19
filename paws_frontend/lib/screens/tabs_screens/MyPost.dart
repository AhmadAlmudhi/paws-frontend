import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/posts_builder.dart';

class MyPosts extends StatelessWidget {
  const MyPosts({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [PostsBuilder(type: 'offer'),],
    );
  }
}
