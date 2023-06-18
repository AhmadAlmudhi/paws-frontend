import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:paws_frontend/widgets/general_widgets/nav_bar_screens.dart';

import 'auth_screens/login_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GetStorage().hasData("token")
        ? const NavBarScreens()
        : const LoginScreen();
  }
}
