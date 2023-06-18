import 'package:flutter/material.dart';
import 'package:paws_frontend/widgets/general_widgets/post.dart';

class MyRequest extends StatelessWidget {
  const MyRequest({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const [
        Post(),
        Post(),
        Post(),
      ],
    );
  }
}
