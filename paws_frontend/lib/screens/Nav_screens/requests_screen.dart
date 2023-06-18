import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/create_post_screen.dart';

import '../../widgets/general_widgets/create_app_bar.dart';
import '../../widgets/general_widgets/posts_builder.dart';

class RequestsScreen extends StatelessWidget {
  const RequestsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context: context,
        title: "Requests",
        icon: Icons.add,
        iconDestination: const CreatePostScreen(
          type: "request",
        ),
      ),
      body: ListView(
        children: const [
          PostsBuilder(type: 'request'),
        ],
      ),
    );
  }
}
