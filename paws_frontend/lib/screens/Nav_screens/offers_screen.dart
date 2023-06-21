import 'package:flutter/material.dart';

import '../../widgets/general_widgets/create_app_bar.dart';
import '../../widgets/general_widgets/posts_builder.dart';
import '../create_post_screen.dart';

class OffersScreen extends StatefulWidget {
  const OffersScreen({super.key});

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context: context,
        title: "Offers",
        icon: Icons.add,
        iconDestination: const CreatePostScreen(
          type: "offer",
        ),
        update: () {
          setState(() {});
        },
      ),
      body: ListView(
        children: const [
          PostsBuilder(
            type: 'offer',
            userFavorites: [],
          ),
        ],
      ),
    );
  }
}
