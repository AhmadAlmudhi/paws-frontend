import 'package:flutter/material.dart';

import '../../../screens/auth_screens/signup_screen.dart';

class AuthMessage extends StatelessWidget {
  const AuthMessage({
    super.key, required this.message, required this.clickmessage,
  });
  final String message;
  final String clickmessage;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
         Text(message),
        TextButton(
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => const SignupScreen()),
                (Route<dynamic> route) => false);
          },
          child: Text(
            clickmessage,
          ),
        ),
      ],
    );
  }
}
