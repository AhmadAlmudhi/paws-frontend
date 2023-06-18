import 'package:flutter/material.dart';
import 'package:paws_frontend/screens/update_profile_screen.dart';

import '../../widgets/general_widgets/create_app_bar.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: createAppBar(
        context: context,
        title: "Profile",
        icon: Icons.edit,
        iconDestination: const UpdateProfileScreen(),
      ),
      body: const Center(
        child: Text("Profile Screen"),
      ),
    );
  }
}
