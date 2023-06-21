import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/create_post_screen.dart';

import '../../widgets/general_widgets/create_app_bar.dart';
import '../../widgets/general_widgets/posts_builder.dart';

class RequestsScreen extends StatefulWidget {
  const RequestsScreen({super.key});

  @override
  State<RequestsScreen> createState() => _RequestsScreenState();
}

class _RequestsScreenState extends State<RequestsScreen> {
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
        update: () {
          setState(() {});
        },
      ),
      body: ListView(
        children: const [
          PostsBuilder(
            type: 'request',
            userFavorites: [],
          ),
        ],
      ),
    );
  }
}
