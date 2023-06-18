import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/dropdown.dart';
import 'package:paws_frontend/widgets/general_widgets/post.dart';

class Fav extends StatelessWidget {
  const Fav({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        dropdown(),
        Post(),
        Post(),
        Post(),
      ],
    );
  }
}
